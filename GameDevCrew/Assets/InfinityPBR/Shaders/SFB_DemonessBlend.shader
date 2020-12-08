// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "SFB_DemonessBlend"
{
	Properties
	{
		_TextureBlend("Texture Blend", Range( 0 , 1)) = 0
		_HeightMultiplier("Height Multiplier", Range( 0 , 1)) = 1
		_EmissionMultplier("Emission Multplier", Range( 0 , 10)) = 1
		[Toggle]_PulseEmission("Pulse Emission", Float) = 0
		_AlbedoOpacity("AlbedoOpacity", 2D) = "white" {}
		_Normal("Normal", 2D) = "bump" {}
		_MetalAOHeightRough("MetalAOHeightRough", 2D) = "white" {}
		_Emission("Emission", 2D) = "white" {}
		_AlbedoOpacity2("AlbedoOpacity2", 2D) = "white" {}
		_Normal2("Normal2", 2D) = "bump" {}
		_MetalAOHeightRough2("MetalAOHeightRough2", 2D) = "white" {}
		_Emission2("Emission2", 2D) = "white" {}
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" "IsEmissive" = "true"  }
		Cull Back
		CGPROGRAM
		#include "UnityShaderVariables.cginc"
		#pragma target 3.0
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows 
		struct Input
		{
			float2 uv_texcoord;
		};

		uniform sampler2D _Normal;
		uniform float4 _Normal_ST;
		uniform sampler2D _Normal2;
		uniform float4 _Normal2_ST;
		uniform float _TextureBlend;
		uniform sampler2D _MetalAOHeightRough2;
		uniform float4 _MetalAOHeightRough2_ST;
		uniform float _HeightMultiplier;
		uniform sampler2D _AlbedoOpacity;
		uniform float4 _AlbedoOpacity_ST;
		uniform sampler2D _AlbedoOpacity2;
		uniform float4 _AlbedoOpacity2_ST;
		uniform float _PulseEmission;
		uniform sampler2D _Emission;
		uniform float4 _Emission_ST;
		uniform sampler2D _Emission2;
		uniform float4 _Emission2_ST;
		uniform float _EmissionMultplier;
		uniform sampler2D _MetalAOHeightRough;
		uniform float4 _MetalAOHeightRough_ST;

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float2 uv_Normal = i.uv_texcoord * _Normal_ST.xy + _Normal_ST.zw;
			float2 uv_Normal2 = i.uv_texcoord * _Normal2_ST.xy + _Normal2_ST.zw;
			float2 uv_MetalAOHeightRough2 = i.uv_texcoord * _MetalAOHeightRough2_ST.xy + _MetalAOHeightRough2_ST.zw;
			float4 tex2DNode5 = tex2D( _MetalAOHeightRough2, uv_MetalAOHeightRough2 );
			float clampResult27 = clamp( ( _TextureBlend + ( _TextureBlend * ( tex2DNode5.b * _HeightMultiplier ) ) ) , 0.0 , 1.0 );
			float3 lerpResult12 = lerp( UnpackNormal( tex2D( _Normal, uv_Normal ) ) , UnpackNormal( tex2D( _Normal2, uv_Normal2 ) ) , clampResult27);
			float3 normalizeResult22 = normalize( lerpResult12 );
			o.Normal = normalizeResult22;
			float2 uv_AlbedoOpacity = i.uv_texcoord * _AlbedoOpacity_ST.xy + _AlbedoOpacity_ST.zw;
			float2 uv_AlbedoOpacity2 = i.uv_texcoord * _AlbedoOpacity2_ST.xy + _AlbedoOpacity2_ST.zw;
			float4 lerpResult10 = lerp( tex2D( _AlbedoOpacity, uv_AlbedoOpacity ) , tex2D( _AlbedoOpacity2, uv_AlbedoOpacity2 ) , clampResult27);
			o.Albedo = lerpResult10.rgb;
			float2 uv_Emission = i.uv_texcoord * _Emission_ST.xy + _Emission_ST.zw;
			float2 uv_Emission2 = i.uv_texcoord * _Emission2_ST.xy + _Emission2_ST.zw;
			float4 lerpResult19 = lerp( tex2D( _Emission, uv_Emission ) , tex2D( _Emission2, uv_Emission2 ) , clampResult27);
			float temp_output_40_0 = ( ( 1 + _SinTime.w ) / 2 );
			o.Emission = lerp(lerpResult19,( ( _EmissionMultplier * temp_output_40_0 ) * lerpResult19 ),_PulseEmission).rgb;
			float2 uv_MetalAOHeightRough = i.uv_texcoord * _MetalAOHeightRough_ST.xy + _MetalAOHeightRough_ST.zw;
			float4 tex2DNode3 = tex2D( _MetalAOHeightRough, uv_MetalAOHeightRough );
			float lerpResult13 = lerp( tex2DNode3.r , tex2DNode5.r , clampResult27);
			o.Metallic = lerpResult13;
			float lerpResult16 = lerp( tex2DNode3.a , tex2DNode5.a , clampResult27);
			o.Smoothness = lerpResult16;
			float lerpResult14 = lerp( tex2DNode3.g , tex2DNode5.g , clampResult27);
			o.Occlusion = lerpResult14;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=15900
5;685;1142;733;321.7279;-400.2876;1.25;True;True
Node;AmplifyShaderEditor.RangedFloatNode;29;-768.1254,552.3113;Float;False;Property;_HeightMultiplier;Height Multiplier;1;0;Create;True;0;0;False;0;1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;5;-780.6876,1148.541;Float;True;Property;_MetalAOHeightRough2;MetalAOHeightRough2;11;0;Create;True;0;0;False;0;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;7;-784.46,463.8734;Float;False;Property;_TextureBlend;Texture Blend;0;0;Create;True;0;0;False;0;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;28;-331.7914,695.5187;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;38;-1544.418,977.4576;Float;False;Constant;_Int0;Int 0;12;0;Create;True;0;0;False;0;1;0;0;1;INT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;24;-307.1769,529.9353;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SinTimeNode;37;-1528.756,1069.201;Float;False;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.IntNode;41;-1208.777,1125.14;Float;False;Constant;_Int1;Int 1;12;0;Create;True;0;0;False;0;2;0;0;1;INT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;23;-328.7618,359.877;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;39;-1296.043,1049.061;Float;False;2;2;0;INT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;40;-1043.192,1011.022;Float;False;2;0;FLOAT;0;False;1;INT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;18;-788.8021,1357.018;Float;True;Property;_Emission2;Emission2;12;0;Create;True;0;0;False;0;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;31;-1336.48,485.1831;Float;False;Property;_EmissionMultplier;Emission Multplier;2;0;Create;True;0;0;False;0;1;0;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;17;-784.7225,239.8038;Float;True;Property;_Emission;Emission;8;0;Create;True;0;0;False;0;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ClampOpNode;27;-170.6826,223.3824;Float;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;6;-785.1629,927.8631;Float;True;Property;_Normal2;Normal2;10;0;Create;True;0;0;False;0;None;None;True;0;False;bump;Auto;True;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;2;-785.4608,-188.4651;Float;True;Property;_Normal;Normal;6;0;Create;True;0;0;False;0;None;None;True;0;False;bump;Auto;True;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;19;108.4915,681.194;Float;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;34;-973.9844,661.9544;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;3;-785.4608,14.31195;Float;True;Property;_MetalAOHeightRough;MetalAOHeightRough;7;0;Create;True;0;0;False;0;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;12;93.29301,38.05075;Float;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SamplerNode;1;-783.5833,-385.6098;Float;True;Property;_AlbedoOpacity;AlbedoOpacity;5;0;Create;True;0;0;False;0;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;4;-781.0478,730.7184;Float;True;Property;_AlbedoOpacity2;AlbedoOpacity2;9;0;Create;True;0;0;False;0;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;32;280.1472,836.4879;Float;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;42;-1244.578,778.3101;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;36;-1584.696,749.2214;Float;False;Property;_TimeSpeed;Time Speed;4;0;Create;True;0;0;False;0;1;1;-5;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.TimeNode;43;-1566.794,832.0129;Float;False;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;10;91.4157,-85.86859;Float;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;14;102.6808,287.7673;Float;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;15;98.92572,413.5643;Float;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;16;104.5584,543.1165;Float;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;13;104.5584,165.7254;Float;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.NormalizeNode;22;291.057,120.4525;Float;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ToggleSwitchNode;44;319.5164,619.4397;Float;False;Property;_PulseEmission;Pulse Emission;3;0;Create;True;0;0;False;0;0;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;546.6746,99.22828;Float;False;True;2;Float;ASEMaterialInspector;0;0;Standard;SFB_DemonessBlend;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;28;0;5;3
WireConnection;28;1;29;0
WireConnection;24;0;7;0
WireConnection;24;1;28;0
WireConnection;23;0;7;0
WireConnection;23;1;24;0
WireConnection;39;0;38;0
WireConnection;39;1;37;4
WireConnection;40;0;39;0
WireConnection;40;1;41;0
WireConnection;27;0;23;0
WireConnection;19;0;17;0
WireConnection;19;1;18;0
WireConnection;19;2;27;0
WireConnection;34;0;31;0
WireConnection;34;1;40;0
WireConnection;12;0;2;0
WireConnection;12;1;6;0
WireConnection;12;2;27;0
WireConnection;32;0;34;0
WireConnection;32;1;19;0
WireConnection;42;0;36;0
WireConnection;42;1;40;0
WireConnection;10;0;1;0
WireConnection;10;1;4;0
WireConnection;10;2;27;0
WireConnection;14;0;3;2
WireConnection;14;1;5;2
WireConnection;14;2;27;0
WireConnection;15;0;3;3
WireConnection;15;1;5;3
WireConnection;15;2;27;0
WireConnection;16;0;3;4
WireConnection;16;1;5;4
WireConnection;16;2;27;0
WireConnection;13;0;3;1
WireConnection;13;1;5;1
WireConnection;13;2;27;0
WireConnection;22;0;12;0
WireConnection;44;0;19;0
WireConnection;44;1;32;0
WireConnection;0;0;10;0
WireConnection;0;1;22;0
WireConnection;0;2;44;0
WireConnection;0;3;13;0
WireConnection;0;4;16;0
WireConnection;0;5;14;0
ASEEND*/
//CHKSM=858A15D56DC787794B438428E1CB0B8136CF25B9