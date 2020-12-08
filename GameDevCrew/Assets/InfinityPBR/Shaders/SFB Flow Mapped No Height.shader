// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'
// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge v1.28 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.28;sub:START;pass:START;ps:flbk:Standard,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:3,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:True,hqlp:False,rprd:True,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:False,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:2865,x:32919,y:31191,varname:node_2865,prsc:2|diff-7508-OUT,spec-636-OUT,gloss-2750-OUT,normal-475-OUT,emission-6895-OUT,difocc-4221-OUT,alpha-9156-OUT;n:type:ShaderForge.SFN_Tex2d,id:8407,x:31743,y:30869,varname:AlbedoOpacity1_1,prsc:2,ntxv:0,isnm:False|UVIN-3768-OUT,TEX-9509-TEX;n:type:ShaderForge.SFN_Time,id:1664,x:29488,y:32252,varname:node_1664,prsc:2;n:type:ShaderForge.SFN_ValueProperty,id:9628,x:29488,y:32479,ptovrint:False,ptlb:Flow Speed,ptin:_FlowSpeed,varname:_FlowSpeed,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Multiply,id:1977,x:29705,y:32311,varname:node_1977,prsc:2|A-1664-T,B-9628-OUT;n:type:ShaderForge.SFN_Add,id:9866,x:29983,y:32369,varname:node_9866,prsc:2|A-1977-OUT,B-5965-OUT;n:type:ShaderForge.SFN_Frac,id:9963,x:29916,y:32198,varname:node_9963,prsc:2|IN-1977-OUT;n:type:ShaderForge.SFN_Frac,id:4067,x:30157,y:32369,varname:node_4067,prsc:2|IN-9866-OUT;n:type:ShaderForge.SFN_TexCoord,id:2320,x:29559,y:31947,varname:node_2320,prsc:2,uv:2;n:type:ShaderForge.SFN_RemapRange,id:6904,x:29940,y:31947,varname:node_6904,prsc:2,frmn:0,frmx:1,tomn:-0.5,tomx:0.5|IN-4795-OUT;n:type:ShaderForge.SFN_ComponentMask,id:4795,x:29725,y:31947,varname:node_4795,prsc:2,cc1:0,cc2:1,cc3:-1,cc4:-1|IN-2320-UVOUT;n:type:ShaderForge.SFN_ValueProperty,id:6928,x:29725,y:31858,ptovrint:False,ptlb:Flow Power,ptin:_FlowPower,varname:_FlowPower,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0.5;n:type:ShaderForge.SFN_Multiply,id:6845,x:29940,y:31803,varname:node_6845,prsc:2|A-3787-OUT,B-6928-OUT;n:type:ShaderForge.SFN_Multiply,id:3357,x:30119,y:31928,varname:node_3357,prsc:2|A-6845-OUT,B-6904-OUT;n:type:ShaderForge.SFN_Multiply,id:7702,x:30329,y:32066,varname:node_7702,prsc:2|A-3357-OUT,B-4067-OUT;n:type:ShaderForge.SFN_Multiply,id:385,x:30329,y:31928,varname:node_385,prsc:2|A-3357-OUT,B-9963-OUT;n:type:ShaderForge.SFN_TexCoord,id:5624,x:30306,y:31587,varname:node_5624,prsc:2,uv:0;n:type:ShaderForge.SFN_Add,id:3768,x:30664,y:31761,varname:node_3768,prsc:2|A-5624-UVOUT,B-385-OUT;n:type:ShaderForge.SFN_Add,id:6669,x:30664,y:31914,varname:node_6669,prsc:2|A-5624-UVOUT,B-7702-OUT;n:type:ShaderForge.SFN_Tex2d,id:6246,x:31743,y:30997,varname:AlbedoOpacity1_2,prsc:2,ntxv:0,isnm:False|UVIN-6669-OUT,TEX-9509-TEX;n:type:ShaderForge.SFN_Lerp,id:4543,x:32048,y:31030,varname:node_4543,prsc:2|A-8407-RGB,B-6246-RGB,T-7750-OUT;n:type:ShaderForge.SFN_Subtract,id:1172,x:29818,y:32576,varname:node_1172,prsc:2|A-8239-OUT,B-9963-OUT;n:type:ShaderForge.SFN_Divide,id:1807,x:29985,y:32576,varname:node_1807,prsc:2|A-1172-OUT,B-8239-OUT;n:type:ShaderForge.SFN_Abs,id:7750,x:30142,y:32590,varname:node_7750,prsc:2|IN-1807-OUT;n:type:ShaderForge.SFN_Vector1,id:8239,x:29527,y:32632,varname:node_8239,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Vector1,id:3787,x:29725,y:31776,varname:node_3787,prsc:2,v1:-1;n:type:ShaderForge.SFN_Vector1,id:5965,x:29777,y:32477,varname:node_5965,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Tex2d,id:3917,x:31743,y:31133,varname:node_3917,prsc:2,ntxv:0,isnm:False|UVIN-3768-OUT,TEX-1943-TEX;n:type:ShaderForge.SFN_Tex2d,id:8189,x:31743,y:31264,varname:node_8189,prsc:2,ntxv:0,isnm:False|UVIN-6669-OUT,TEX-1943-TEX;n:type:ShaderForge.SFN_Lerp,id:475,x:32048,y:31164,varname:node_475,prsc:2|A-3917-RGB,B-8189-RGB,T-7750-OUT;n:type:ShaderForge.SFN_Tex2d,id:3576,x:31743,y:31397,varname:node_3576,prsc:2,ntxv:0,isnm:False|UVIN-3768-OUT,TEX-3772-TEX;n:type:ShaderForge.SFN_Tex2d,id:9816,x:31743,y:31529,varname:node_9816,prsc:2,ntxv:0,isnm:False|UVIN-6669-OUT,TEX-3772-TEX;n:type:ShaderForge.SFN_Lerp,id:9234,x:32048,y:31294,varname:node_9234,prsc:2|A-3576-R,B-9816-R,T-7750-OUT;n:type:ShaderForge.SFN_Lerp,id:3424,x:32048,y:31420,varname:node_3424,prsc:2|A-3576-G,B-9816-G,T-7750-OUT;n:type:ShaderForge.SFN_Lerp,id:1469,x:32048,y:31552,varname:node_1469,prsc:2|A-3576-B,B-9816-B,T-7750-OUT;n:type:ShaderForge.SFN_Lerp,id:1674,x:32048,y:31676,varname:node_1674,prsc:2|A-3576-A,B-9816-A,T-7750-OUT;n:type:ShaderForge.SFN_Tex2d,id:968,x:31743,y:31943,varname:node_968,prsc:2,ntxv:0,isnm:False|UVIN-3768-OUT,TEX-2838-TEX;n:type:ShaderForge.SFN_Tex2d,id:5676,x:31743,y:32077,varname:node_5676,prsc:2,ntxv:0,isnm:False|UVIN-6669-OUT,TEX-2838-TEX;n:type:ShaderForge.SFN_Lerp,id:6895,x:32048,y:32063,varname:node_6895,prsc:2|A-968-RGB,B-5676-RGB,T-7750-OUT;n:type:ShaderForge.SFN_Tex2dAsset,id:1943,x:31225,y:31150,ptovrint:False,ptlb:Normal,ptin:_Normal,varname:node_1943,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:3,isnm:True;n:type:ShaderForge.SFN_Tex2dAsset,id:3772,x:31225,y:31336,ptovrint:False,ptlb:Meatllic Roughness,ptin:_MeatllicRoughness,varname:node_3772,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2dAsset,id:2838,x:31227,y:31743,ptovrint:False,ptlb:Emissive,ptin:_Emissive,varname:node_2838,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:2,isnm:False;n:type:ShaderForge.SFN_Tex2dAsset,id:9509,x:31225,y:30957,ptovrint:False,ptlb:Albedo Opacity,ptin:_AlbedoOpacity,varname:node_9509,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:2,isnm:False;n:type:ShaderForge.SFN_Vector1,id:9156,x:32683,y:31486,varname:node_9156,prsc:2,v1:1;n:type:ShaderForge.SFN_Color,id:3246,x:32328,y:31253,ptovrint:False,ptlb:Color,ptin:_Color,varname:node_3246,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Multiply,id:7508,x:32328,y:31098,varname:node_7508,prsc:2|A-4543-OUT,B-3246-RGB;n:type:ShaderForge.SFN_Slider,id:6749,x:32215,y:31591,ptovrint:False,ptlb:Metallic,ptin:_Metallic,varname:node_6749,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Slider,id:5534,x:32201,y:31960,ptovrint:False,ptlb:Roughness,ptin:_Roughness,varname:node_5534,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_OneMinus,id:4474,x:32528,y:31923,varname:node_4474,prsc:2|IN-5534-OUT;n:type:ShaderForge.SFN_SwitchProperty,id:636,x:32620,y:31636,ptovrint:False,ptlb:Use Metallic Map?,ptin:_UseMetallicMap,varname:node_636,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:True|A-6749-OUT,B-9234-OUT;n:type:ShaderForge.SFN_SwitchProperty,id:2750,x:32752,y:31825,ptovrint:False,ptlb:Use Roughness Map?,ptin:_UseRoughnessMap,varname:node_2750,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:True|A-4474-OUT,B-1674-OUT;n:type:ShaderForge.SFN_Tex2dAsset,id:9218,x:31227,y:31528,ptovrint:False,ptlb:Ambient Occlusion,ptin:_AmbientOcclusion,varname:node_9218,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:6685,x:31743,y:31662,varname:node_6685,prsc:2,ntxv:0,isnm:False|UVIN-3768-OUT,TEX-9218-TEX;n:type:ShaderForge.SFN_Tex2d,id:6189,x:31743,y:31797,varname:node_6189,prsc:2,ntxv:0,isnm:False|UVIN-6669-OUT,TEX-9218-TEX;n:type:ShaderForge.SFN_Lerp,id:4221,x:32048,y:31804,varname:node_4221,prsc:2|A-6685-R,B-6189-R,T-7750-OUT;proporder:9509-3246-1943-3772-636-2750-6749-5534-9218-2838-9628-6928;pass:END;sub:END;*/

Shader "SFBayStudios/SFB Flow Mapped No Height" {
    Properties {
        _AlbedoOpacity ("Albedo Opacity", 2D) = "black" {}
        _Color ("Color", Color) = (1,1,1,1)
        _Normal ("Normal", 2D) = "bump" {}
        _MeatllicRoughness ("Meatllic Roughness", 2D) = "white" {}
        [MaterialToggle] _UseMetallicMap ("Use Metallic Map?", Float ) = 0
        [MaterialToggle] _UseRoughnessMap ("Use Roughness Map?", Float ) = 0
        _Metallic ("Metallic", Range(0, 1)) = 0
        _Roughness ("Roughness", Range(0, 1)) = 0
        _AmbientOcclusion ("Ambient Occlusion", 2D) = "white" {}
        _Emissive ("Emissive", 2D) = "black" {}
        _FlowSpeed ("Flow Speed", Float ) = 1
        _FlowPower ("Flow Power", Float ) = 0.5
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Transparent"
            "RenderType"="Transparent"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #define SHOULD_SAMPLE_SH ( defined (LIGHTMAP_OFF) && defined(DYNAMICLIGHTMAP_OFF) )
            #define _GLOSSYENV 1
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #include "UnityPBSLighting.cginc"
            #include "UnityStandardBRDF.cginc"
            #pragma multi_compile_fwdbase
            #pragma multi_compile LIGHTMAP_OFF LIGHTMAP_ON
            #pragma multi_compile DIRLIGHTMAP_OFF DIRLIGHTMAP_COMBINED DIRLIGHTMAP_SEPARATE
            #pragma multi_compile DYNAMICLIGHTMAP_OFF DYNAMICLIGHTMAP_ON
            #pragma multi_compile_fog
            #pragma exclude_renderers d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform float4 _TimeEditor;
            uniform float _FlowSpeed;
            uniform float _FlowPower;
            uniform sampler2D _Normal; uniform float4 _Normal_ST;
            uniform sampler2D _MeatllicRoughness; uniform float4 _MeatllicRoughness_ST;
            uniform sampler2D _Emissive; uniform float4 _Emissive_ST;
            uniform sampler2D _AlbedoOpacity; uniform float4 _AlbedoOpacity_ST;
            uniform float4 _Color;
            uniform float _Metallic;
            uniform float _Roughness;
            uniform fixed _UseMetallicMap;
            uniform fixed _UseRoughnessMap;
            uniform sampler2D _AmbientOcclusion; uniform float4 _AmbientOcclusion_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
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
                float3 normalDir : TEXCOORD4;
                float3 tangentDir : TEXCOORD5;
                float3 bitangentDir : TEXCOORD6;
                UNITY_FOG_COORDS(7)
                #if defined(LIGHTMAP_ON) || defined(UNITY_SHOULD_SAMPLE_SH)
                    float4 ambientOrLightmapUV : TEXCOORD8;
                #endif
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.uv1 = v.texcoord1;
                o.uv2 = v.texcoord2;
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
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float2 node_3357 = (((-1.0)*_FlowPower)*(i.uv2.rg*1.0+-0.5));
                float4 node_1664 = _Time + _TimeEditor;
                float node_1977 = (node_1664.g*_FlowSpeed);
                float node_9963 = frac(node_1977);
                float2 node_3768 = (i.uv0+(node_3357*node_9963));
                float3 node_3917 = UnpackNormal(tex2D(_Normal,TRANSFORM_TEX(node_3768, _Normal)));
                float2 node_6669 = (i.uv0+(node_3357*frac((node_1977+0.5))));
                float3 node_8189 = UnpackNormal(tex2D(_Normal,TRANSFORM_TEX(node_6669, _Normal)));
                float node_8239 = 0.5;
                float node_7750 = abs(((node_8239-node_9963)/node_8239));
                float3 normalLocal = lerp(node_3917.rgb,node_8189.rgb,node_7750);
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float3 viewReflectDirection = reflect( -viewDirection, normalDirection );
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 lightColor = _LightColor0.rgb;
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = 1;
                float3 attenColor = attenuation * _LightColor0.xyz;
                float Pi = 3.141592654;
                float InvPi = 0.31830988618;
///////// Gloss:
                float4 node_3576 = tex2D(_MeatllicRoughness,TRANSFORM_TEX(node_3768, _MeatllicRoughness));
                float4 node_9816 = tex2D(_MeatllicRoughness,TRANSFORM_TEX(node_6669, _MeatllicRoughness));
                float gloss = lerp( (1.0 - _Roughness), lerp(node_3576.a,node_9816.a,node_7750), _UseRoughnessMap );
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
                float3 specularColor = lerp( _Metallic, lerp(node_3576.r,node_9816.r,node_7750), _UseMetallicMap );
                float specularMonochrome;
                float4 AlbedoOpacity1_1 = tex2D(_AlbedoOpacity,TRANSFORM_TEX(node_3768, _AlbedoOpacity));
                float4 AlbedoOpacity1_2 = tex2D(_AlbedoOpacity,TRANSFORM_TEX(node_6669, _AlbedoOpacity));
                float3 diffuseColor = (lerp(AlbedoOpacity1_1.rgb,AlbedoOpacity1_2.rgb,node_7750)*_Color.rgb); // Need this for specular when using metallic
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
                float4 node_6685 = tex2D(_AmbientOcclusion,TRANSFORM_TEX(node_3768, _AmbientOcclusion));
                float4 node_6189 = tex2D(_AmbientOcclusion,TRANSFORM_TEX(node_6669, _AmbientOcclusion));
                indirectDiffuse *= lerp(node_6685.r,node_6189.r,node_7750); // Diffuse AO
                float3 diffuse = (directDiffuse + indirectDiffuse) * diffuseColor;
////// Emissive:
                float4 node_968 = tex2D(_Emissive,TRANSFORM_TEX(node_3768, _Emissive));
                float4 node_5676 = tex2D(_Emissive,TRANSFORM_TEX(node_6669, _Emissive));
                float3 emissive = lerp(node_968.rgb,node_5676.rgb,node_7750);
/// Final Color:
                float3 finalColor = diffuse + specular + emissive;
                fixed4 finalRGBA = fixed4(finalColor,1.0);
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
            ZWrite Off
            
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
            #pragma multi_compile_fwdadd
            #pragma multi_compile LIGHTMAP_OFF LIGHTMAP_ON
            #pragma multi_compile DIRLIGHTMAP_OFF DIRLIGHTMAP_COMBINED DIRLIGHTMAP_SEPARATE
            #pragma multi_compile DYNAMICLIGHTMAP_OFF DYNAMICLIGHTMAP_ON
            #pragma multi_compile_fog
            #pragma exclude_renderers d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform float4 _TimeEditor;
            uniform float _FlowSpeed;
            uniform float _FlowPower;
            uniform sampler2D _Normal; uniform float4 _Normal_ST;
            uniform sampler2D _MeatllicRoughness; uniform float4 _MeatllicRoughness_ST;
            uniform sampler2D _Emissive; uniform float4 _Emissive_ST;
            uniform sampler2D _AlbedoOpacity; uniform float4 _AlbedoOpacity_ST;
            uniform float4 _Color;
            uniform float _Metallic;
            uniform float _Roughness;
            uniform fixed _UseMetallicMap;
            uniform fixed _UseRoughnessMap;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
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
                float3 normalDir : TEXCOORD4;
                float3 tangentDir : TEXCOORD5;
                float3 bitangentDir : TEXCOORD6;
                LIGHTING_COORDS(7,8)
                UNITY_FOG_COORDS(9)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.uv1 = v.texcoord1;
                o.uv2 = v.texcoord2;
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
                float2 node_3357 = (((-1.0)*_FlowPower)*(i.uv2.rg*1.0+-0.5));
                float4 node_1664 = _Time + _TimeEditor;
                float node_1977 = (node_1664.g*_FlowSpeed);
                float node_9963 = frac(node_1977);
                float2 node_3768 = (i.uv0+(node_3357*node_9963));
                float3 node_3917 = UnpackNormal(tex2D(_Normal,TRANSFORM_TEX(node_3768, _Normal)));
                float2 node_6669 = (i.uv0+(node_3357*frac((node_1977+0.5))));
                float3 node_8189 = UnpackNormal(tex2D(_Normal,TRANSFORM_TEX(node_6669, _Normal)));
                float node_8239 = 0.5;
                float node_7750 = abs(((node_8239-node_9963)/node_8239));
                float3 normalLocal = lerp(node_3917.rgb,node_8189.rgb,node_7750);
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 lightColor = _LightColor0.rgb;
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
                float Pi = 3.141592654;
                float InvPi = 0.31830988618;
///////// Gloss:
                float4 node_3576 = tex2D(_MeatllicRoughness,TRANSFORM_TEX(node_3768, _MeatllicRoughness));
                float4 node_9816 = tex2D(_MeatllicRoughness,TRANSFORM_TEX(node_6669, _MeatllicRoughness));
                float gloss = lerp( (1.0 - _Roughness), lerp(node_3576.a,node_9816.a,node_7750), _UseRoughnessMap );
                float specPow = exp2( gloss * 10.0+1.0);
////// Specular:
                float NdotL = max(0, dot( normalDirection, lightDirection ));
                float LdotH = max(0.0,dot(lightDirection, halfDirection));
                float3 specularColor = lerp( _Metallic, lerp(node_3576.r,node_9816.r,node_7750), _UseMetallicMap );
                float specularMonochrome;
                float4 AlbedoOpacity1_1 = tex2D(_AlbedoOpacity,TRANSFORM_TEX(node_3768, _AlbedoOpacity));
                float4 AlbedoOpacity1_2 = tex2D(_AlbedoOpacity,TRANSFORM_TEX(node_6669, _AlbedoOpacity));
                float3 diffuseColor = (lerp(AlbedoOpacity1_1.rgb,AlbedoOpacity1_2.rgb,node_7750)*_Color.rgb); // Need this for specular when using metallic
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
                fixed4 finalRGBA = fixed4(finalColor * 1.0,0);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
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
            uniform float4 _TimeEditor;
            uniform float _FlowSpeed;
            uniform float _FlowPower;
            uniform sampler2D _MeatllicRoughness; uniform float4 _MeatllicRoughness_ST;
            uniform sampler2D _Emissive; uniform float4 _Emissive_ST;
            uniform sampler2D _AlbedoOpacity; uniform float4 _AlbedoOpacity_ST;
            uniform float4 _Color;
            uniform float _Metallic;
            uniform float _Roughness;
            uniform fixed _UseMetallicMap;
            uniform fixed _UseRoughnessMap;
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
                
                float2 node_3357 = (((-1.0)*_FlowPower)*(i.uv2.rg*1.0+-0.5));
                float4 node_1664 = _Time + _TimeEditor;
                float node_1977 = (node_1664.g*_FlowSpeed);
                float node_9963 = frac(node_1977);
                float2 node_3768 = (i.uv0+(node_3357*node_9963));
                float4 node_968 = tex2D(_Emissive,TRANSFORM_TEX(node_3768, _Emissive));
                float2 node_6669 = (i.uv0+(node_3357*frac((node_1977+0.5))));
                float4 node_5676 = tex2D(_Emissive,TRANSFORM_TEX(node_6669, _Emissive));
                float node_8239 = 0.5;
                float node_7750 = abs(((node_8239-node_9963)/node_8239));
                o.Emission = lerp(node_968.rgb,node_5676.rgb,node_7750);
                
                float4 AlbedoOpacity1_1 = tex2D(_AlbedoOpacity,TRANSFORM_TEX(node_3768, _AlbedoOpacity));
                float4 AlbedoOpacity1_2 = tex2D(_AlbedoOpacity,TRANSFORM_TEX(node_6669, _AlbedoOpacity));
                float3 diffColor = (lerp(AlbedoOpacity1_1.rgb,AlbedoOpacity1_2.rgb,node_7750)*_Color.rgb);
                float specularMonochrome;
                float3 specColor;
                float4 node_3576 = tex2D(_MeatllicRoughness,TRANSFORM_TEX(node_3768, _MeatllicRoughness));
                float4 node_9816 = tex2D(_MeatllicRoughness,TRANSFORM_TEX(node_6669, _MeatllicRoughness));
                diffColor = DiffuseAndSpecularFromMetallic( diffColor, lerp( _Metallic, lerp(node_3576.r,node_9816.r,node_7750), _UseMetallicMap ), specColor, specularMonochrome );
                float roughness = 1.0 - lerp( (1.0 - _Roughness), lerp(node_3576.a,node_9816.a,node_7750), _UseRoughnessMap );
                o.Albedo = diffColor + specColor * roughness * roughness * 0.5;
                
                return UnityMetaFragment( o );
            }
            ENDCG
        }
    }
    FallBack "Standard"
    CustomEditor "ShaderForgeMaterialInspector"
}
