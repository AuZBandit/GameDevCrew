// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'
// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge v1.28 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.28;sub:START;pass:START;ps:flbk:Standard,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:3,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:True,hqlp:False,rprd:True,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:2,rntp:3,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:2865,x:34686,y:32411,varname:node_2865,prsc:2|diff-6343-OUT,spec-1348-R,gloss-1348-A,normal-1395-OUT,emission-3898-RGB,difocc-995-R,clip-2354-OUT;n:type:ShaderForge.SFN_Multiply,id:6343,x:32232,y:32635,varname:node_6343,prsc:2|A-9733-RGB,B-6665-RGB;n:type:ShaderForge.SFN_Color,id:6665,x:32232,y:32804,ptovrint:False,ptlb:Color,ptin:_Color,varname:_Color,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Tex2dAsset,id:4037,x:31387,y:32690,ptovrint:False,ptlb:Albedo Opacity 1,ptin:_AlbedoOpacity1,varname:_AlbedoOpacity1,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:8bd6005f9bdc84c0c9feac733f094b02,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Time,id:1664,x:29488,y:32252,varname:node_1664,prsc:2;n:type:ShaderForge.SFN_ValueProperty,id:9628,x:29488,y:32479,ptovrint:False,ptlb:Flow Speed,ptin:_FlowSpeed,varname:_FlowSpeed,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Multiply,id:1977,x:29705,y:32311,varname:node_1977,prsc:2|A-1664-T,B-9628-OUT;n:type:ShaderForge.SFN_Add,id:9866,x:29983,y:32369,varname:node_9866,prsc:2|A-1977-OUT,B-5965-OUT;n:type:ShaderForge.SFN_Frac,id:9963,x:29916,y:32198,varname:node_9963,prsc:2|IN-1977-OUT;n:type:ShaderForge.SFN_Frac,id:4067,x:30157,y:32369,varname:node_4067,prsc:2|IN-9866-OUT;n:type:ShaderForge.SFN_TexCoord,id:2320,x:29559,y:31947,varname:node_2320,prsc:2,uv:2;n:type:ShaderForge.SFN_RemapRange,id:6904,x:29940,y:31947,varname:node_6904,prsc:2,frmn:0,frmx:1,tomn:-0.5,tomx:0.5|IN-4795-OUT;n:type:ShaderForge.SFN_ComponentMask,id:4795,x:29725,y:31947,varname:node_4795,prsc:2,cc1:0,cc2:1,cc3:-1,cc4:-1|IN-2320-UVOUT;n:type:ShaderForge.SFN_ValueProperty,id:6928,x:29725,y:31858,ptovrint:False,ptlb:Flow Power,ptin:_FlowPower,varname:_FlowPower,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0.5;n:type:ShaderForge.SFN_Multiply,id:6845,x:29940,y:31803,varname:node_6845,prsc:2|A-3787-OUT,B-6928-OUT;n:type:ShaderForge.SFN_Multiply,id:3357,x:30119,y:31928,varname:node_3357,prsc:2|A-6845-OUT,B-6904-OUT;n:type:ShaderForge.SFN_Multiply,id:7702,x:30329,y:32066,varname:node_7702,prsc:2|A-3357-OUT,B-4067-OUT;n:type:ShaderForge.SFN_Multiply,id:385,x:30329,y:31928,varname:node_385,prsc:2|A-3357-OUT,B-9963-OUT;n:type:ShaderForge.SFN_TexCoord,id:5624,x:30306,y:31587,varname:node_5624,prsc:2,uv:0;n:type:ShaderForge.SFN_Add,id:3768,x:30664,y:31761,varname:node_3768,prsc:2|A-5624-UVOUT,B-385-OUT;n:type:ShaderForge.SFN_Add,id:6669,x:30664,y:31914,varname:node_6669,prsc:2|A-5624-UVOUT,B-7702-OUT;n:type:ShaderForge.SFN_Subtract,id:1172,x:29818,y:32576,varname:node_1172,prsc:2|A-8239-OUT,B-9963-OUT;n:type:ShaderForge.SFN_Divide,id:1807,x:29985,y:32576,varname:node_1807,prsc:2|A-1172-OUT,B-8239-OUT;n:type:ShaderForge.SFN_Abs,id:7750,x:30142,y:32590,varname:node_7750,prsc:2|IN-1807-OUT;n:type:ShaderForge.SFN_Vector1,id:8239,x:29527,y:32632,varname:node_8239,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Vector1,id:3787,x:29725,y:31776,varname:node_3787,prsc:2,v1:-1;n:type:ShaderForge.SFN_Vector1,id:5965,x:29777,y:32477,varname:node_5965,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Tex2dAsset,id:9666,x:31403,y:32924,ptovrint:False,ptlb:Normal 1,ptin:_Normal1,varname:node_9666,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:3,isnm:True;n:type:ShaderForge.SFN_Tex2d,id:3917,x:32547,y:31812,varname:node_3917,prsc:2,ntxv:0,isnm:False|UVIN-3768-OUT,TEX-1943-TEX;n:type:ShaderForge.SFN_Tex2d,id:8189,x:32547,y:31943,varname:node_8189,prsc:2,ntxv:0,isnm:False|UVIN-6669-OUT,TEX-1943-TEX;n:type:ShaderForge.SFN_Lerp,id:475,x:32852,y:31843,varname:node_475,prsc:2|A-3917-RGB,B-8189-RGB,T-7750-OUT;n:type:ShaderForge.SFN_Tex2dAsset,id:9187,x:31416,y:33221,ptovrint:False,ptlb:Metal Rough 1,ptin:_MetalRough1,varname:node_9187,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2dAsset,id:5582,x:31423,y:33670,ptovrint:False,ptlb:Emissive 1,ptin:_Emissive1,varname:node_5582,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:2,isnm:False;n:type:ShaderForge.SFN_VertexColor,id:2638,x:31307,y:32367,varname:node_2638,prsc:2;n:type:ShaderForge.SFN_Tex2dAsset,id:1943,x:32021,y:31881,ptovrint:False,ptlb:Normal 2,ptin:_Normal2,varname:node_1943,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:3,isnm:True;n:type:ShaderForge.SFN_Lerp,id:9775,x:34046,y:32218,varname:node_9775,prsc:2|A-8113-RGB,B-475-OUT,T-9655-OUT;n:type:ShaderForge.SFN_Slider,id:8648,x:31229,y:32179,ptovrint:False,ptlb:R Vertex Shift,ptin:_RVertexShift,varname:node_8648,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:-1,cur:0,max:1;n:type:ShaderForge.SFN_Add,id:442,x:31625,y:32161,varname:node_442,prsc:2|A-8648-OUT,B-2638-R;n:type:ShaderForge.SFN_Add,id:9655,x:33446,y:32216,varname:node_9655,prsc:2|A-1891-OUT,B-442-OUT;n:type:ShaderForge.SFN_Slider,id:1891,x:32838,y:32171,ptovrint:False,ptlb:R Contrast,ptin:_RContrast,varname:node_1891,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:-10,cur:0,max:0.5;n:type:ShaderForge.SFN_Tex2d,id:9733,x:31708,y:32681,varname:node_9733,prsc:2,tex:8bd6005f9bdc84c0c9feac733f094b02,ntxv:0,isnm:False|TEX-4037-TEX;n:type:ShaderForge.SFN_Tex2d,id:8113,x:31697,y:32888,varname:node_8113,prsc:2,ntxv:0,isnm:False|TEX-9666-TEX;n:type:ShaderForge.SFN_Tex2d,id:1348,x:31701,y:33208,varname:node_1348,prsc:2,ntxv:0,isnm:False|TEX-9187-TEX;n:type:ShaderForge.SFN_Tex2d,id:3898,x:31686,y:33672,varname:node_3898,prsc:2,ntxv:0,isnm:False|TEX-5582-TEX;n:type:ShaderForge.SFN_Tex2dAsset,id:5212,x:31417,y:33497,ptovrint:False,ptlb:Ambient Occlusion 1,ptin:_AmbientOcclusion1,varname:node_5212,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:995,x:31695,y:33504,varname:node_995,prsc:2,ntxv:0,isnm:False|TEX-5212-TEX;n:type:ShaderForge.SFN_ValueProperty,id:8161,x:33980,y:32912,ptovrint:False,ptlb:Cutoff,ptin:_Cutoff,varname:node_8161,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Add,id:2354,x:34114,y:32976,varname:node_2354,prsc:2|A-8161-OUT,B-9733-A;n:type:ShaderForge.SFN_Normalize,id:1395,x:34211,y:32254,varname:node_1395,prsc:2|IN-9775-OUT;proporder:4037-6665-9666-9187-5212-5582-1943-8648-1891-9628-6928-8161;pass:END;sub:END;*/

Shader "SFBayStudios/SFB Weeper Flow Mapped" {
    Properties {
        _AlbedoOpacity1 ("Albedo Opacity 1", 2D) = "white" {}
        _Color ("Color", Color) = (1,1,1,1)
        _Normal1 ("Normal 1", 2D) = "bump" {}
        _MetalRough1 ("Metal Rough 1", 2D) = "white" {}
        _AmbientOcclusion1 ("Ambient Occlusion 1", 2D) = "white" {}
        _Emissive1 ("Emissive 1", 2D) = "black" {}
        _Normal2 ("Normal 2", 2D) = "bump" {}
        _RVertexShift ("R Vertex Shift", Range(-1, 1)) = 0
        _RContrast ("R Contrast", Range(-10, 0.5)) = 0
        _FlowSpeed ("Flow Speed", Float ) = 1
        _FlowPower ("Flow Power", Float ) = 0.5
        _Cutoff ("Cutoff", Float ) = 0
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "Queue"="AlphaTest"
            "RenderType"="TransparentCutout"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #define SHOULD_SAMPLE_SH ( defined (LIGHTMAP_OFF) && defined(DYNAMICLIGHTMAP_OFF) )
            #define _GLOSSYENV 1
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #include "Lighting.cginc"
            #include "UnityPBSLighting.cginc"
            #include "UnityStandardBRDF.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile LIGHTMAP_OFF LIGHTMAP_ON
            #pragma multi_compile DIRLIGHTMAP_OFF DIRLIGHTMAP_COMBINED DIRLIGHTMAP_SEPARATE
            #pragma multi_compile DYNAMICLIGHTMAP_OFF DYNAMICLIGHTMAP_ON
            #pragma multi_compile_fog
            #pragma exclude_renderers d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform float4 _TimeEditor;
            uniform float4 _Color;
            uniform sampler2D _AlbedoOpacity1; uniform float4 _AlbedoOpacity1_ST;
            uniform float _FlowSpeed;
            uniform float _FlowPower;
            uniform sampler2D _Normal1; uniform float4 _Normal1_ST;
            uniform sampler2D _MetalRough1; uniform float4 _MetalRough1_ST;
            uniform sampler2D _Emissive1; uniform float4 _Emissive1_ST;
            uniform sampler2D _Normal2; uniform float4 _Normal2_ST;
            uniform float _RVertexShift;
            uniform float _RContrast;
            uniform sampler2D _AmbientOcclusion1; uniform float4 _AmbientOcclusion1_ST;
            uniform float _Cutoff;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
                float2 texcoord1 : TEXCOORD1;
                float2 texcoord2 : TEXCOORD2;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float2 uv1 : TEXCOORD1;
                float2 uv2 : TEXCOORD2;
                float4 posWorld : TEXCOORD3;
                float3 normalDir : TEXCOORD4;
                float3 tangentDir : TEXCOORD5;
                float3 bitangentDir : TEXCOORD6;
                float4 vertexColor : COLOR;
                LIGHTING_COORDS(7,8)
                UNITY_FOG_COORDS(9)
                #if defined(LIGHTMAP_ON) || defined(UNITY_SHOULD_SAMPLE_SH)
                    float4 ambientOrLightmapUV : TEXCOORD10;
                #endif
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.uv1 = v.texcoord1;
                o.uv2 = v.texcoord2;
                o.vertexColor = v.vertexColor;
                #ifdef LIGHTMAP_ON
                    o.ambientOrLightmapUV.xy = v.texcoord1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
                    o.ambientOrLightmapUV.zw = 0;
                #elif UNITY_SHOULD_SAMPLE_SH
                #endif
                #ifdef DYNAMICLIGHTMAP_ON
                    o.ambientOrLightmapUV.zw = v.texcoord2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
                #endif
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos(v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 node_8113 = UnpackNormal(tex2D(_Normal1,TRANSFORM_TEX(i.uv0, _Normal1)));
                float2 node_3357 = (((-1.0)*_FlowPower)*(i.uv2.rg*1.0+-0.5));
                float4 node_1664 = _Time + _TimeEditor;
                float node_1977 = (node_1664.g*_FlowSpeed);
                float node_9963 = frac(node_1977);
                float2 node_3768 = (i.uv0+(node_3357*node_9963));
                float3 node_3917 = UnpackNormal(tex2D(_Normal2,TRANSFORM_TEX(node_3768, _Normal2)));
                float2 node_6669 = (i.uv0+(node_3357*frac((node_1977+0.5))));
                float3 node_8189 = UnpackNormal(tex2D(_Normal2,TRANSFORM_TEX(node_6669, _Normal2)));
                float node_8239 = 0.5;
                float3 normalLocal = normalize(lerp(node_8113.rgb,lerp(node_3917.rgb,node_8189.rgb,abs(((node_8239-node_9963)/node_8239))),(_RContrast+(_RVertexShift+i.vertexColor.r))));
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float3 viewReflectDirection = reflect( -viewDirection, normalDirection );
                float4 node_9733 = tex2D(_AlbedoOpacity1,TRANSFORM_TEX(i.uv0, _AlbedoOpacity1));
                clip((_Cutoff+node_9733.a) - 0.5);
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 lightColor = _LightColor0.rgb;
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
                float Pi = 3.141592654;
                float InvPi = 0.31830988618;
///////// Gloss:
                float4 node_1348 = tex2D(_MetalRough1,TRANSFORM_TEX(i.uv0, _MetalRough1));
                float gloss = node_1348.a;
                float specPow = exp2( gloss * 10.0+1.0);
/////// GI Data:
                UnityLight light;
                #ifdef LIGHTMAP_OFF
                    light.color = lightColor;
                    light.dir = lightDirection;
                    light.ndotl = LambertTerm (normalDirection, light.dir);
                #else
                    light.color = half3(0.f, 0.f, 0.f);
                    light.ndotl = 0.0f;
                    light.dir = half3(0.f, 0.f, 0.f);
                #endif
                UnityGIInput d;
                d.light = light;
                d.worldPos = i.posWorld.xyz;
                d.worldViewDir = viewDirection;
                d.atten = attenuation;
                #if defined(LIGHTMAP_ON) || defined(DYNAMICLIGHTMAP_ON)
                    d.ambient = 0;
                    d.lightmapUV = i.ambientOrLightmapUV;
                #else
                    d.ambient = i.ambientOrLightmapUV;
                #endif
                d.boxMax[0] = unity_SpecCube0_BoxMax;
                d.boxMin[0] = unity_SpecCube0_BoxMin;
                d.probePosition[0] = unity_SpecCube0_ProbePosition;
                d.probeHDR[0] = unity_SpecCube0_HDR;
                d.boxMax[1] = unity_SpecCube1_BoxMax;
                d.boxMin[1] = unity_SpecCube1_BoxMin;
                d.probePosition[1] = unity_SpecCube1_ProbePosition;
                d.probeHDR[1] = unity_SpecCube1_HDR;
                Unity_GlossyEnvironmentData ugls_en_data;
                ugls_en_data.roughness = 1.0 - gloss;
                ugls_en_data.reflUVW = viewReflectDirection;
                UnityGI gi = UnityGlobalIllumination(d, 1, normalDirection, ugls_en_data );
                lightDirection = gi.light.dir;
                lightColor = gi.light.color;
////// Specular:
                float NdotL = max(0, dot( normalDirection, lightDirection ));
                float LdotH = max(0.0,dot(lightDirection, halfDirection));
                float3 specularColor = node_1348.r;
                float specularMonochrome;
                float3 diffuseColor = (node_9733.rgb*_Color.rgb); // Need this for specular when using metallic
                diffuseColor = DiffuseAndSpecularFromMetallic( diffuseColor, specularColor, specularColor, specularMonochrome );
                specularMonochrome = 1.0-specularMonochrome;
                float NdotV = max(0.0,dot( normalDirection, viewDirection ));
                float NdotH = max(0.0,dot( normalDirection, halfDirection ));
                float VdotH = max(0.0,dot( viewDirection, halfDirection ));
                float visTerm = SmithJointGGXVisibilityTerm( NdotL, NdotV, 1.0-gloss );
                float normTerm = max(0.0, GGXTerm(NdotH, 1.0-gloss));
                float specularPBL = (NdotL*visTerm*normTerm) * (UNITY_PI / 4);
                if (IsGammaSpace())
                    specularPBL = sqrt(max(1e-4h, specularPBL));
                specularPBL = max(0, specularPBL * NdotL);
                float3 directSpecular = (floor(attenuation) * _LightColor0.xyz)*specularPBL*FresnelTerm(specularColor, LdotH);
                half grazingTerm = saturate( gloss + specularMonochrome );
                float3 indirectSpecular = (gi.indirect.specular);
                indirectSpecular *= FresnelLerp (specularColor, grazingTerm, NdotV);
                float3 specular = (directSpecular + indirectSpecular);
/////// Diffuse:
                NdotL = max(0.0,dot( normalDirection, lightDirection ));
                half fd90 = 0.5 + 2 * LdotH * LdotH * (1-gloss);
                float nlPow5 = Pow5(1-NdotL);
                float nvPow5 = Pow5(1-NdotV);
                float3 directDiffuse = ((1 +(fd90 - 1)*nlPow5) * (1 + (fd90 - 1)*nvPow5) * NdotL) * attenColor;
                float3 indirectDiffuse = float3(0,0,0);
                indirectDiffuse += gi.indirect.diffuse;
                float4 node_995 = tex2D(_AmbientOcclusion1,TRANSFORM_TEX(i.uv0, _AmbientOcclusion1));
                indirectDiffuse *= node_995.r; // Diffuse AO
                float3 diffuse = (directDiffuse + indirectDiffuse) * diffuseColor;
////// Emissive:
                float4 node_3898 = tex2D(_Emissive1,TRANSFORM_TEX(i.uv0, _Emissive1));
                float3 emissive = node_3898.rgb;
/// Final Color:
                float3 finalColor = diffuse + specular + emissive;
                fixed4 finalRGBA = fixed4(finalColor,1);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
        Pass {
            Name "FORWARD_DELTA"
            Tags {
                "LightMode"="ForwardAdd"
            }
            Blend One One
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDADD
            #define SHOULD_SAMPLE_SH ( defined (LIGHTMAP_OFF) && defined(DYNAMICLIGHTMAP_OFF) )
            #define _GLOSSYENV 1
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #include "Lighting.cginc"
            #include "UnityPBSLighting.cginc"
            #include "UnityStandardBRDF.cginc"
            #pragma multi_compile_fwdadd_fullshadows
            #pragma multi_compile LIGHTMAP_OFF LIGHTMAP_ON
            #pragma multi_compile DIRLIGHTMAP_OFF DIRLIGHTMAP_COMBINED DIRLIGHTMAP_SEPARATE
            #pragma multi_compile DYNAMICLIGHTMAP_OFF DYNAMICLIGHTMAP_ON
            #pragma multi_compile_fog
            #pragma exclude_renderers d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform float4 _TimeEditor;
            uniform float4 _Color;
            uniform sampler2D _AlbedoOpacity1; uniform float4 _AlbedoOpacity1_ST;
            uniform float _FlowSpeed;
            uniform float _FlowPower;
            uniform sampler2D _Normal1; uniform float4 _Normal1_ST;
            uniform sampler2D _MetalRough1; uniform float4 _MetalRough1_ST;
            uniform sampler2D _Emissive1; uniform float4 _Emissive1_ST;
            uniform sampler2D _Normal2; uniform float4 _Normal2_ST;
            uniform float _RVertexShift;
            uniform float _RContrast;
            uniform float _Cutoff;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
                float2 texcoord1 : TEXCOORD1;
                float2 texcoord2 : TEXCOORD2;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float2 uv1 : TEXCOORD1;
                float2 uv2 : TEXCOORD2;
                float4 posWorld : TEXCOORD3;
                float3 normalDir : TEXCOORD4;
                float3 tangentDir : TEXCOORD5;
                float3 bitangentDir : TEXCOORD6;
                float4 vertexColor : COLOR;
                LIGHTING_COORDS(7,8)
                UNITY_FOG_COORDS(9)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.uv1 = v.texcoord1;
                o.uv2 = v.texcoord2;
                o.vertexColor = v.vertexColor;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos(v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 node_8113 = UnpackNormal(tex2D(_Normal1,TRANSFORM_TEX(i.uv0, _Normal1)));
                float2 node_3357 = (((-1.0)*_FlowPower)*(i.uv2.rg*1.0+-0.5));
                float4 node_1664 = _Time + _TimeEditor;
                float node_1977 = (node_1664.g*_FlowSpeed);
                float node_9963 = frac(node_1977);
                float2 node_3768 = (i.uv0+(node_3357*node_9963));
                float3 node_3917 = UnpackNormal(tex2D(_Normal2,TRANSFORM_TEX(node_3768, _Normal2)));
                float2 node_6669 = (i.uv0+(node_3357*frac((node_1977+0.5))));
                float3 node_8189 = UnpackNormal(tex2D(_Normal2,TRANSFORM_TEX(node_6669, _Normal2)));
                float node_8239 = 0.5;
                float3 normalLocal = normalize(lerp(node_8113.rgb,lerp(node_3917.rgb,node_8189.rgb,abs(((node_8239-node_9963)/node_8239))),(_RContrast+(_RVertexShift+i.vertexColor.r))));
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float4 node_9733 = tex2D(_AlbedoOpacity1,TRANSFORM_TEX(i.uv0, _AlbedoOpacity1));
                clip((_Cutoff+node_9733.a) - 0.5);
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 lightColor = _LightColor0.rgb;
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
                float Pi = 3.141592654;
                float InvPi = 0.31830988618;
///////// Gloss:
                float4 node_1348 = tex2D(_MetalRough1,TRANSFORM_TEX(i.uv0, _MetalRough1));
                float gloss = node_1348.a;
                float specPow = exp2( gloss * 10.0+1.0);
////// Specular:
                float NdotL = max(0, dot( normalDirection, lightDirection ));
                float LdotH = max(0.0,dot(lightDirection, halfDirection));
                float3 specularColor = node_1348.r;
                float specularMonochrome;
                float3 diffuseColor = (node_9733.rgb*_Color.rgb); // Need this for specular when using metallic
                diffuseColor = DiffuseAndSpecularFromMetallic( diffuseColor, specularColor, specularColor, specularMonochrome );
                specularMonochrome = 1.0-specularMonochrome;
                float NdotV = max(0.0,dot( normalDirection, viewDirection ));
                float NdotH = max(0.0,dot( normalDirection, halfDirection ));
                float VdotH = max(0.0,dot( viewDirection, halfDirection ));
                float visTerm = SmithJointGGXVisibilityTerm( NdotL, NdotV, 1.0-gloss );
                float normTerm = max(0.0, GGXTerm(NdotH, 1.0-gloss));
                float specularPBL = (NdotL*visTerm*normTerm) * (UNITY_PI / 4);
                if (IsGammaSpace())
                    specularPBL = sqrt(max(1e-4h, specularPBL));
                specularPBL = max(0, specularPBL * NdotL);
                float3 directSpecular = attenColor*specularPBL*FresnelTerm(specularColor, LdotH);
                float3 specular = directSpecular;
/////// Diffuse:
                NdotL = max(0.0,dot( normalDirection, lightDirection ));
                half fd90 = 0.5 + 2 * LdotH * LdotH * (1-gloss);
                float nlPow5 = Pow5(1-NdotL);
                float nvPow5 = Pow5(1-NdotV);
                float3 directDiffuse = ((1 +(fd90 - 1)*nlPow5) * (1 + (fd90 - 1)*nvPow5) * NdotL) * attenColor;
                float3 diffuse = directDiffuse * diffuseColor;
/// Final Color:
                float3 finalColor = diffuse + specular;
                fixed4 finalRGBA = fixed4(finalColor * 1,0);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
        Pass {
            Name "ShadowCaster"
            Tags {
                "LightMode"="ShadowCaster"
            }
            Offset 1, 1
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_SHADOWCASTER
            #define SHOULD_SAMPLE_SH ( defined (LIGHTMAP_OFF) && defined(DYNAMICLIGHTMAP_OFF) )
            #define _GLOSSYENV 1
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #include "UnityPBSLighting.cginc"
            #include "UnityStandardBRDF.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma multi_compile LIGHTMAP_OFF LIGHTMAP_ON
            #pragma multi_compile DIRLIGHTMAP_OFF DIRLIGHTMAP_COMBINED DIRLIGHTMAP_SEPARATE
            #pragma multi_compile DYNAMICLIGHTMAP_OFF DYNAMICLIGHTMAP_ON
            #pragma multi_compile_fog
            #pragma exclude_renderers d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform sampler2D _AlbedoOpacity1; uniform float4 _AlbedoOpacity1_ST;
            uniform float _Cutoff;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
                float2 texcoord1 : TEXCOORD1;
                float2 texcoord2 : TEXCOORD2;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
                float2 uv0 : TEXCOORD1;
                float2 uv1 : TEXCOORD2;
                float2 uv2 : TEXCOORD3;
                float4 posWorld : TEXCOORD4;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.uv1 = v.texcoord1;
                o.uv2 = v.texcoord2;
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos(v.vertex );
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float4 node_9733 = tex2D(_AlbedoOpacity1,TRANSFORM_TEX(i.uv0, _AlbedoOpacity1));
                clip((_Cutoff+node_9733.a) - 0.5);
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
        Pass {
            Name "Meta"
            Tags {
                "LightMode"="Meta"
            }
            Cull Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_META 1
            #define SHOULD_SAMPLE_SH ( defined (LIGHTMAP_OFF) && defined(DYNAMICLIGHTMAP_OFF) )
            #define _GLOSSYENV 1
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #include "UnityPBSLighting.cginc"
            #include "UnityStandardBRDF.cginc"
            #include "UnityMetaPass.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma multi_compile LIGHTMAP_OFF LIGHTMAP_ON
            #pragma multi_compile DIRLIGHTMAP_OFF DIRLIGHTMAP_COMBINED DIRLIGHTMAP_SEPARATE
            #pragma multi_compile DYNAMICLIGHTMAP_OFF DYNAMICLIGHTMAP_ON
            #pragma multi_compile_fog
            #pragma exclude_renderers d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform float4 _Color;
            uniform sampler2D _AlbedoOpacity1; uniform float4 _AlbedoOpacity1_ST;
            uniform sampler2D _MetalRough1; uniform float4 _MetalRough1_ST;
            uniform sampler2D _Emissive1; uniform float4 _Emissive1_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
                float2 texcoord1 : TEXCOORD1;
                float2 texcoord2 : TEXCOORD2;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float2 uv1 : TEXCOORD1;
                float2 uv2 : TEXCOORD2;
                float4 posWorld : TEXCOORD3;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.uv1 = v.texcoord1;
                o.uv2 = v.texcoord2;
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityMetaVertexPosition(v.vertex, v.texcoord1.xy, v.texcoord2.xy, unity_LightmapST, unity_DynamicLightmapST );
                return o;
            }
            float4 frag(VertexOutput i) : SV_Target {
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                UnityMetaInput o;
                UNITY_INITIALIZE_OUTPUT( UnityMetaInput, o );
                
                float4 node_3898 = tex2D(_Emissive1,TRANSFORM_TEX(i.uv0, _Emissive1));
                o.Emission = node_3898.rgb;
                
                float4 node_9733 = tex2D(_AlbedoOpacity1,TRANSFORM_TEX(i.uv0, _AlbedoOpacity1));
                float3 diffColor = (node_9733.rgb*_Color.rgb);
                float specularMonochrome;
                float3 specColor;
                float4 node_1348 = tex2D(_MetalRough1,TRANSFORM_TEX(i.uv0, _MetalRough1));
                diffColor = DiffuseAndSpecularFromMetallic( diffColor, node_1348.r, specColor, specularMonochrome );
                float roughness = 1.0 - node_1348.a;
                o.Albedo = diffColor + specColor * roughness * roughness * 0.5;
                
                return UnityMetaFragment( o );
            }
            ENDCG
        }
    }
    FallBack "Standard"
    CustomEditor "ShaderForgeMaterialInspector"
}
