// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'
// Upgrade NOTE: replaced '_World2Object' with 'unity_WorldToObject'
// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "SFBayStudios/HairAndFur" {
    Properties {
    	_Color ("Color", Color) = (1,1,1,1)
		_MainTex ("Albedo (RGB)", 2D) = "white" {}
		_Normal ("Normal", 2D) = "bump" {}

		_Density ("Fur Density", Range(0,12)) = 1
    	_Volume ("Fur Volume", Range(-10,10)) = 0.0

    	_Fuziness ("Fur Fuziness", Range(0,2)) = 0.5
    	[HideInInspector]_FurDepth("Fur Base", Range(0,1)) = 0.5
    	_FurGlossiness("Fur Glossiness", Range(0,1)) = 0.5

		[HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "Queue"="Transparent"
            "RenderType"="Transparent"
        }

        CGINCLUDE
        #include "UnityCG.cginc"
        //#include "AutoLight.cginc"
        //#include "Lighting.cginc"

        #define TAM 36

        //STRUCTS

        struct VertexInput {
			float4 vertex : POSITION;

			float2 uv : TEXCOORD0;
			float3 normal: NORMAL;
			float4 tangent: TANGENT;
		};

		struct v2g {
			float4 vertex : SV_POSITION;

			float2 uv : TEXCOORD0;
			float3 pos: TEXCOORD1;

			float3 normal: NORMAL;
			float4 tangent: TANGENT;
		};

		struct g2f {
			float4 pos : SV_POSITION;

			float2 uv : TEXCOORD0;

			float3 normal: NORMAL;
			float4 tangent: TANGENT;

			float4 worldPos : TEXCOORD1;

			//LIGHTING_COORDS(2,3)
		};

		uniform float4 _Color;
		uniform sampler2D _MainTex;
		uniform sampler2D _Normal;

		uniform float4 _LightColor0; // color of light source (from "Lighting.cginc")
		uniform sampler2D _LightTexture0; // cookie alpha texture map (from Autolight.cginc)
		uniform float4x4 unity_WorldToLight; // transformation - from world to light space (from Autolight.cginc)

		uniform int _Density;
        uniform float _Volume;

        uniform float _Fuziness;
        uniform float _FurGlossiness;

        //RAVART FUNCTIONS

		//--REFLECTION
        float3 R(float3 L, float3 N){
        	return L - 2.0 * dot(N, L) * N;
        }

        //--UNPACK NORMAL
        float3 Unpack(float4 input){
            #if defined(SHADER_API_GLES) && defined(SHADER_API_MOBILE)
            	return input.xyz * 2 - 1;
            #else
            	float3 normal;
            	normal.xy = input.wy * 2 - 1;
            	normal.z = sqrt(1 - normal.x*normal.x - normal.y * normal.y);
				return normal;
			#endif
        }

        //SPECULAR
		float calcBlinn(float3 N, float3 L, float3 V, float gloss){
			float shininess = exp2( gloss * 10.0 + 1.0);
            float3 specular = float3(1,1,1);

            float3 H = normalize(L + V);
            specular *= pow( max(0, dot(H, N)), shininess);

            return specular;
        }

        float calcPhong(float3 N, float3 L, float3 V, float gloss){
        	float shininess = exp2( gloss * 10.0 + 1.0);
            float3 specular = float3(1,1,1);

            specular *= pow( max(0, dot(R(-L, N), V)), shininess);
            //if (dot(N, L) < 0.0){
            //	specular = float3(0.0, 0.0, 0.0);
            //}
            return specular;
        }

        //###

        v2g vert (VertexInput v) {
			v2g o;
			o.vertex = v.vertex;
			o.pos = UnityObjectToClipPos(v.vertex);//v.vertex;

			o.uv = v.uv;
			o.normal = v.normal;
			o.tangent = v.tangent;

			//o.worldPos = mul(_Object2World, v.vertex);

			float3 lightColor = _LightColor0.rgb;
			//TRANSFER_VERTEX_TO_FRAGMENT(o)

			return o;
		}


		[maxvertexcount(TAM)] //point || triangle
		void geom(triangle v2g p[3], inout TriangleStream<g2f> triStream){
			g2f tri;
			for (int j = 0; j < _Density; j++){
				for (int k = 0; k < 3; k++){
					float4 adjust = float4( p[k].vertex.xyz + p[k].normal * _Volume * j, p[k].vertex.w);

					tri.pos = UnityObjectToClipPos(adjust);
					tri.uv = p[k].uv;
					tri.normal = p[k].normal;
					tri.tangent = p[k].tangent;

					tri.worldPos = mul(unity_ObjectToWorld, p[k].vertex);;

					triStream.Append(tri);
				}

				triStream.RestartStrip();
			}
		}

		float4 calcMain(g2f input, float b){

        	float4 output;
        	
			float4 mainTex = tex2D(_MainTex, input.uv);
			float3 normalTex = Unpack(tex2D(_Normal, input.uv));


			//******** DIFFUSE
			float3 diffuse = mainTex.rgb * _Color.rgb;

			//******** CAM

			//******** NORMAL

        	//float3 N = normalize(input.normal);

        	float4x4 modelMatrix = unity_ObjectToWorld;
            float4x4 modelMatrixInverse = unity_WorldToObject;
 
            float3 tangentWorld = normalize( mul(modelMatrix, float4(input.tangent.xyz, 0.0)).xyz);
            float3 normalWorld = normalize( mul(float4(input.normal, 0.0), modelMatrixInverse).xyz);
            float3 binormalWorld = normalize( cross(normalWorld, tangentWorld) * input.tangent.w);

            float3x3 tangentTransform = float3x3(tangentWorld, binormalWorld, normalWorld);

			float3 N = normalize(mul(normalTex, tangentTransform));

			//******** LIGHT
			float3 L = normalize( lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - input.worldPos.xyz, _WorldSpaceLightPos0.w));

			float attenuation = 1;
			if (0.0 != _WorldSpaceLightPos0.w){ // directional light?
				float3 lightVec = input.worldPos.xyz - _WorldSpaceLightPos0.xyz;
            	float distance = length(lightVec);

            	attenuation = 1;

            	//attenuation = 2 * tex2D(_LightTexture0, float2(distance, distance)).r;
            }

			float NdotL = max(0.0, dot(N, L));

			float cookie = 1.0;
			float4 lightPos = mul(unity_WorldToLight, input.worldPos);

            if (0.0 == _WorldSpaceLightPos0.w) { // directional light?
            	cookie = tex2D(_LightTexture0, lightPos.xy).a;
            }
            else if (1.0 != unity_WorldToLight[3][3]) { // spotlight (i.e. not a point light)?
            	cookie = tex2D(_LightTexture0, lightPos.xy / lightPos.w + float2(0.5, 0.5)).a;
            }

            float furLight = _FurGlossiness;

			float3 light =  attenuation * cookie * NdotL;

			//******** FINAL
			output.rgb = lerp( diffuse * light, diffuse * light * _LightColor0.rgb , furLight);

			//******** ALPHA
			output.a = mainTex.a * _Color.a;
			//output = lerp(0, output, furRoot);

			float furFuziness = clamp(mainTex.a + (_Fuziness - 0.5),  0,1);
            output.a = lerp(0, output.a, furFuziness);


            if(b != 0){
            	output.rgb *= mainTex.a * furLight/10;
            }
        	
        	return	output;

        }

        ENDCG

        Pass {
			Tags {  // pass for ambient light 
                "LightMode"="ForwardBase"
            }

            Blend SrcAlpha OneMinusSrcAlpha
            ZWrite OFF
            Cull Off
			
			CGPROGRAM
			#pragma vertex vert
			#pragma geometry geom
			#pragma fragment frag

			float4 frag(g2f input) : COLOR {

				float4 output = calcMain(input, 0);

				return output;
			}
            
            ENDCG
		}

        Pass {
            Name "FORWARD_DELTA"
            Tags {
                "LightMode"="ForwardAdd"
            }
            Blend One One
            Cull Off
            ZWrite Off

            CGPROGRAM
            #pragma vertex vert
             #pragma geometry geom
            #pragma fragment frag
            //#define UNITY_PASS_FORWARDADD
            #pragma multi_compile_fwdadd_fullshadows
            //#pragma multi_compile_fog

            float4 frag(g2f input) : COLOR {

            	return calcMain(input, 1);
			}

            ENDCG
        }
    }

    FallBack "Diffuse"
}
