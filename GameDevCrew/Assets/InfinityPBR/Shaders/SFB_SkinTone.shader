// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "SFBayStudios/SFB_SkinTone"
{
	Properties
	{
		_Albedo("Albedo", 2D) = "white" {}
		_Normal("Normal", 2D) = "bump" {}
		_MetalAOHeightRough("MetalAOHeightRough", 2D) = "white" {}
		_ColorMask("Color Mask", 2D) = "white" {}
		_SkinHue("Skin Hue", Range( -0.5 , 0.5)) = 0
		_SkinSaturation("Skin Saturation", Range( -1 , 1)) = 0
		_SkinContrast("Skin Contrast", Range( 0 , 1)) = 1
		_SkinLightness("Skin Lightness", Range( -1 , 1)) = 0
		[Toggle(_USER_ON)] _UseR("Use R", Float) = 0
		_RMultiply("R Multiply", Color) = (1,1,1,0)
		_RHue("R Hue", Range( -0.5 , 0.5)) = 0
		_RSaturation("R Saturation", Range( -1 , 1)) = 0
		_RContrast("R Contrast", Range( 0 , 1)) = 1
		_RLightness("R Lightness", Range( -1 , 1)) = 0
		[Toggle(_USEG_ON)] _UseG("Use G", Float) = 0
		_GMultiply("G Multiply", Color) = (1,1,1,0)
		_GHue("G Hue", Range( -0.5 , 0.5)) = 0
		_GSaturation("G Saturation", Range( -1 , 1)) = 0
		_GContrast("G Contrast", Range( 0 , 1)) = 1
		_GLightness("G Lightness", Range( -1 , 1)) = 0
		[Toggle(_USEB_ON)] _UseB("Use B", Float) = 0
		_BMultiply("B Multiply", Color) = (1,1,1,0)
		_BHue("B Hue", Range( -0.5 , 0.5)) = 0
		_BSaturation("B Saturation", Range( -1 , 1)) = 0
		_BContrast("B Contrast", Range( 0 , 1)) = 1
		_BLightness("B Lightness", Range( -1 , 1)) = 0
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" }
		Cull Back
		CGPROGRAM
		#pragma target 3.0
		#pragma shader_feature _USER_ON
		#pragma shader_feature _USEG_ON
		#pragma shader_feature _USEB_ON
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows 
		struct Input
		{
			float2 uv_texcoord;
		};

		uniform sampler2D _Normal;
		uniform float4 _Normal_ST;
		uniform float _SkinHue;
		uniform float _SkinContrast;
		uniform sampler2D _Albedo;
		uniform float4 _Albedo_ST;
		uniform float _SkinSaturation;
		uniform float _SkinLightness;
		uniform float _RHue;
		uniform float _RContrast;
		uniform float _RSaturation;
		uniform float _RLightness;
		uniform float4 _RMultiply;
		uniform sampler2D _ColorMask;
		uniform float4 _ColorMask_ST;
		uniform float _GHue;
		uniform float _GContrast;
		uniform float _GSaturation;
		uniform float _GLightness;
		uniform float4 _GMultiply;
		uniform float _BHue;
		uniform float _BContrast;
		uniform float _BSaturation;
		uniform float _BLightness;
		uniform float4 _BMultiply;
		uniform sampler2D _MetalAOHeightRough;
		uniform float4 _MetalAOHeightRough_ST;


		float3 HSVToRGB( float3 c )
		{
			float4 K = float4( 1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0 );
			float3 p = abs( frac( c.xxx + K.xyz ) * 6.0 - K.www );
			return c.z * lerp( K.xxx, saturate( p - K.xxx ), c.y );
		}


		float3 RGBToHSV(float3 c)
		{
			float4 K = float4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
			float4 p = lerp( float4( c.bg, K.wz ), float4( c.gb, K.xy ), step( c.b, c.g ) );
			float4 q = lerp( float4( p.xyw, c.r ), float4( c.r, p.yzx ), step( p.x, c.r ) );
			float d = q.x - min( q.w, q.y );
			float e = 1.0e-10;
			return float3( abs(q.z + (q.w - q.y) / (6.0 * d + e)), d / (q.x + e), q.x);
		}

		float4 CalculateContrast( float contrastValue, float4 colorTarget )
		{
			float t = 0.5 * ( 1.0 - contrastValue );
			return mul( float4x4( contrastValue,0,0,t, 0,contrastValue,0,t, 0,0,contrastValue,t, 0,0,0,1 ), colorTarget );
		}

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float2 uv_Normal = i.uv_texcoord * _Normal_ST.xy + _Normal_ST.zw;
			o.Normal = UnpackNormal( tex2D( _Normal, uv_Normal ) );
			float2 uv_Albedo = i.uv_texcoord * _Albedo_ST.xy + _Albedo_ST.zw;
			float4 tex2DNode1 = tex2D( _Albedo, uv_Albedo );
			float3 hsvTorgb18 = RGBToHSV( CalculateContrast(_SkinContrast,tex2DNode1).rgb );
			float3 hsvTorgb7 = HSVToRGB( float3(( _SkinHue + hsvTorgb18.x ),( _SkinSaturation + hsvTorgb18.y ),( _SkinLightness + hsvTorgb18.z )) );
			float3 hsvTorgb33 = RGBToHSV( CalculateContrast(_RContrast,tex2DNode1).rgb );
			float3 hsvTorgb40 = HSVToRGB( float3(( _RHue + hsvTorgb33.x ),( _RSaturation + hsvTorgb33.y ),( _RLightness + hsvTorgb33.z )) );
			float4 blendOpSrc47 = float4( hsvTorgb40 , 0.0 );
			float4 blendOpDest47 = _RMultiply;
			float2 uv_ColorMask = i.uv_texcoord * _ColorMask_ST.xy + _ColorMask_ST.zw;
			float4 tex2DNode21 = tex2D( _ColorMask, uv_ColorMask );
			#ifdef _USER_ON
				float staticSwitch26 = tex2DNode21.r;
			#else
				float staticSwitch26 = 0.0;
			#endif
			float4 lerpResult44 = lerp( float4( hsvTorgb7 , 0.0 ) , ( saturate( ( blendOpSrc47 * blendOpDest47 ) )) , staticSwitch26);
			float3 hsvTorgb57 = RGBToHSV( CalculateContrast(_GContrast,tex2DNode1).rgb );
			float3 hsvTorgb62 = HSVToRGB( float3(( _GHue + hsvTorgb57.x ),( _GSaturation + hsvTorgb57.y ),( _GLightness + hsvTorgb57.z )) );
			float4 blendOpSrc64 = float4( hsvTorgb62 , 0.0 );
			float4 blendOpDest64 = _GMultiply;
			#ifdef _USEG_ON
				float staticSwitch51 = tex2DNode21.g;
			#else
				float staticSwitch51 = 0.0;
			#endif
			float4 lerpResult77 = lerp( lerpResult44 , ( saturate( ( blendOpSrc64 * blendOpDest64 ) )) , staticSwitch51);
			float3 hsvTorgb69 = RGBToHSV( CalculateContrast(_BContrast,tex2DNode1).rgb );
			float3 hsvTorgb74 = HSVToRGB( float3(( _BHue + hsvTorgb69.x ),( _BSaturation + hsvTorgb69.y ),( _BLightness + hsvTorgb69.z )) );
			float4 blendOpSrc76 = float4( hsvTorgb74 , 0.0 );
			float4 blendOpDest76 = _BMultiply;
			#ifdef _USEB_ON
				float staticSwitch52 = tex2DNode21.b;
			#else
				float staticSwitch52 = 0.0;
			#endif
			float4 lerpResult78 = lerp( lerpResult77 , ( saturate( ( blendOpSrc76 * blendOpDest76 ) )) , staticSwitch52);
			o.Albedo = lerpResult78.rgb;
			float2 uv_MetalAOHeightRough = i.uv_texcoord * _MetalAOHeightRough_ST.xy + _MetalAOHeightRough_ST.zw;
			float4 tex2DNode3 = tex2D( _MetalAOHeightRough, uv_MetalAOHeightRough );
			o.Metallic = tex2DNode3.r;
			o.Smoothness = tex2DNode3.a;
			o.Occlusion = tex2DNode3.g;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=16100
1;740;1104;678;2934.859;277.7678;3.365976;True;True
Node;AmplifyShaderEditor.RangedFloatNode;31;-1658.096,82.70896;Float;False;Property;_RContrast;R Contrast;12;0;Create;True;0;0;False;0;1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;1;-1867.621,-120.1753;Float;True;Property;_Albedo;Albedo;0;0;Create;True;0;0;False;0;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;53;-1667.692,602.2177;Float;False;Property;_GContrast;G Contrast;18;0;Create;True;0;0;False;0;1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;20;-1487.868,-516.9313;Float;False;Property;_SkinContrast;Skin Contrast;6;0;Create;True;0;0;False;0;1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleContrastOpNode;32;-1378.848,189.3416;Float;False;2;1;COLOR;0,0,0,0;False;0;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;34;-1169.932,114.1453;Float;False;Property;_RLightness;R Lightness;13;0;Create;True;0;0;False;0;0;0;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;35;-1164.888,31.79985;Float;False;Property;_RSaturation;R Saturation;11;0;Create;True;0;0;False;0;0;0;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleContrastOpNode;54;-1388.444,708.8504;Float;False;2;1;COLOR;0,0,0,0;False;0;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;36;-1171.229,-40.06701;Float;False;Property;_RHue;R Hue;10;0;Create;True;0;0;False;0;0;0;-0.5;0.5;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleContrastOpNode;19;-1208.62,-410.2986;Float;False;2;1;COLOR;0,0,0,0;False;0;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;65;-1667.692,988.4943;Float;False;Property;_BContrast;B Contrast;24;0;Create;True;0;0;False;0;1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RGBToHSVNode;33;-1117.397,184.7395;Float;False;1;0;FLOAT3;0,0,0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleAddOpNode;39;-833.0327,-7.451766;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;55;-1174.484,551.3087;Float;False;Property;_GSaturation;G Saturation;17;0;Create;True;0;0;False;0;0;0;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;58;-1180.825,479.4419;Float;False;Property;_GHue;G Hue;16;0;Create;True;0;0;False;0;0;0;-0.5;0.5;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;56;-1179.528,633.6541;Float;False;Property;_GLightness;G Lightness;19;0;Create;True;0;0;False;0;0;0;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RGBToHSVNode;57;-1126.993,704.2483;Float;False;1;0;FLOAT3;0,0,0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleContrastOpNode;66;-1388.444,1095.127;Float;False;2;1;COLOR;0,0,0,0;False;0;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;37;-835.1464,86.75632;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;12;-994.6595,-567.8405;Float;False;Property;_SkinSaturation;Skin Saturation;5;0;Create;True;0;0;False;0;0;0;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;13;-999.7036,-485.4949;Float;False;Property;_SkinLightness;Skin Lightness;7;0;Create;True;0;0;False;0;0;0;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RGBToHSVNode;18;-947.1685,-414.9007;Float;False;1;0;FLOAT3;0,0,0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleAddOpNode;38;-835.1464,179.7599;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;9;-1001.001,-639.7073;Float;False;Property;_SkinHue;Skin Hue;4;0;Create;True;0;0;False;0;0;0;-0.5;0.5;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;67;-1174.484,937.5853;Float;False;Property;_BSaturation;B Saturation;23;0;Create;True;0;0;False;0;0;0;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;30;-677.1252,212.0405;Float;False;Property;_RMultiply;R Multiply;9;0;Create;True;0;0;False;0;1,1,1,0;1,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;11;-664.9183,-419.8803;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;21;-925.0664,1626.108;Float;True;Property;_ColorMask;Color Mask;3;0;Create;True;0;0;False;0;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;70;-1180.825,865.7185;Float;False;Property;_BHue;B Hue;22;0;Create;True;0;0;False;0;0;0;-0.5;0.5;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;10;-664.9183,-512.8839;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;59;-844.7426,699.2687;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;60;-844.7426,606.2651;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.HSVToRGBNode;40;-671.6726,26.1365;Float;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleAddOpNode;8;-662.8046,-607.0921;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;68;-1179.528,1019.931;Float;False;Property;_BLightness;B Lightness;25;0;Create;True;0;0;False;0;0;0;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RGBToHSVNode;69;-1126.993,1090.525;Float;False;1;0;FLOAT3;0,0,0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleAddOpNode;61;-842.6288,512.0571;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;63;-686.7213,731.5493;Float;False;Property;_GMultiply;G Multiply;15;0;Create;True;0;0;False;0;1,1,1,0;1,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;41;-688.3942,1464.604;Float;False;Constant;_Float0;Float 0;13;0;Create;True;0;0;False;0;0;0;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.HSVToRGBNode;62;-681.2687,545.6453;Float;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleAddOpNode;71;-844.7425,1085.545;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.BlendOpsNode;47;-442.7582,153.9425;Float;False;Multiply;True;2;0;FLOAT3;0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.HSVToRGBNode;7;-501.4445,-573.5038;Float;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.StaticSwitch;26;-335.0211,1420.328;Float;False;Property;_UseR;Use R;8;0;Create;True;0;0;False;0;0;0;0;True;;Toggle;2;Key0;Key1;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;73;-842.6287,898.3337;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;72;-844.7425,992.5417;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;75;-686.7212,1117.826;Float;False;Property;_BMultiply;B Multiply;21;0;Create;True;0;0;False;0;1,1,1,0;1,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;44;-141.5179,55.092;Float;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.BlendOpsNode;64;-452.3548,673.4514;Float;False;Multiply;True;2;0;FLOAT3;0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.HSVToRGBNode;74;-681.2686,931.9219;Float;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.StaticSwitch;51;-346.9482,1520.899;Float;False;Property;_UseG;Use G;14;0;Create;True;0;0;False;0;0;0;0;True;;Toggle;2;Key0;Key1;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.BlendOpsNode;76;-452.3547,1059.728;Float;False;Multiply;True;2;0;FLOAT3;0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StaticSwitch;52;-349.6202,1638.474;Float;False;Property;_UseB;Use B;20;0;Create;True;0;0;False;0;0;0;0;True;;Toggle;2;Key0;Key1;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;77;9.643405,331.5622;Float;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;78;174.3855,546.7353;Float;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;2;190.3851,1024.63;Float;True;Property;_Normal;Normal;1;0;Create;True;0;0;False;0;None;None;True;0;False;bump;Auto;True;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;3;161.748,1209.271;Float;True;Property;_MetalAOHeightRough;MetalAOHeightRough;2;0;Create;True;0;0;False;0;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;496.1081,1010.301;Float;False;True;2;Float;ASEMaterialInspector;0;0;Standard;SFBayStudios/SFB_SkinTone;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;32;1;1;0
WireConnection;32;0;31;0
WireConnection;54;1;1;0
WireConnection;54;0;53;0
WireConnection;19;1;1;0
WireConnection;19;0;20;0
WireConnection;33;0;32;0
WireConnection;39;0;36;0
WireConnection;39;1;33;1
WireConnection;57;0;54;0
WireConnection;66;1;1;0
WireConnection;66;0;65;0
WireConnection;37;0;35;0
WireConnection;37;1;33;2
WireConnection;18;0;19;0
WireConnection;38;0;34;0
WireConnection;38;1;33;3
WireConnection;11;0;13;0
WireConnection;11;1;18;3
WireConnection;10;0;12;0
WireConnection;10;1;18;2
WireConnection;59;0;56;0
WireConnection;59;1;57;3
WireConnection;60;0;55;0
WireConnection;60;1;57;2
WireConnection;40;0;39;0
WireConnection;40;1;37;0
WireConnection;40;2;38;0
WireConnection;8;0;9;0
WireConnection;8;1;18;1
WireConnection;69;0;66;0
WireConnection;61;0;58;0
WireConnection;61;1;57;1
WireConnection;62;0;61;0
WireConnection;62;1;60;0
WireConnection;62;2;59;0
WireConnection;71;0;68;0
WireConnection;71;1;69;3
WireConnection;47;0;40;0
WireConnection;47;1;30;0
WireConnection;7;0;8;0
WireConnection;7;1;10;0
WireConnection;7;2;11;0
WireConnection;26;0;21;1
WireConnection;73;0;70;0
WireConnection;73;1;69;1
WireConnection;72;0;67;0
WireConnection;72;1;69;2
WireConnection;44;0;7;0
WireConnection;44;1;47;0
WireConnection;44;2;26;0
WireConnection;64;0;62;0
WireConnection;64;1;63;0
WireConnection;74;0;73;0
WireConnection;74;1;72;0
WireConnection;74;2;71;0
WireConnection;51;1;41;0
WireConnection;51;0;21;2
WireConnection;76;0;74;0
WireConnection;76;1;75;0
WireConnection;52;1;41;0
WireConnection;52;0;21;3
WireConnection;77;0;44;0
WireConnection;77;1;64;0
WireConnection;77;2;51;0
WireConnection;78;0;77;0
WireConnection;78;1;76;0
WireConnection;78;2;52;0
WireConnection;0;0;78;0
WireConnection;0;1;2;0
WireConnection;0;3;3;1
WireConnection;0;4;3;4
WireConnection;0;5;3;2
ASEEND*/
//CHKSM=1EEACFD3F65D4A43771AE4AEA44F33787366507D