struct PS {
    float4 Position   : SV_Position;
    float2 Texcoord   : TEXCOORD0;
    float4 Colour     : COLOR0;
    float3 Normal     : NORMAL0;
    float4 PositionWS : POSITION1;
    float3 NormalWS   : NORMAL1;
    float  Depth      : TEXCOORD1;
};

struct OUTPUT {
    float4 Colour0 : SV_Target0;
    float4 Colour1 : SV_Target1;
    float4 Colour2 : SV_Target2;
};

uniform float4 u_vForceColour;

float3 DepthToRGB( float depth ) {
    return float3( floor( depth * 255.0 ) / 255.0,
	               frac(  depth * 255.0 ),
				   frac(  depth * 255.0 * 255.0 ) );
}
/*
float4 DepthToRGBA( float depth ) {
    return float4( floor( depth * 255.0 ) / 255.0,
	               frac(  depth * 255.0 ),
				   frac(  depth * 255.0 * 255.0 ),
				   frac(  depth * 255.0 * 255.0 * 255.0 ) );
}
*/
OUTPUT main(PS In) {
    OUTPUT Out;
    Out.Colour0  = lerp( In.Colour, float4( u_vForceColour.rgb, 1.0 ), u_vForceColour.a );
    Out.Colour0 *= float4( gm_BaseTextureObject.Sample( gm_BaseTexture, In.Texcoord ).rgb, 1. );
    Out.Colour1  = float4( DepthToRGB( In.Depth ), u_vForceColour.a );
    Out.Colour2  = float4( .5 + .5*In.NormalWS, 1. );
    return Out;
}