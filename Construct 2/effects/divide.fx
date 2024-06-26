﻿/////////////////////////////////////////////////////////
// Divide effect
varying mediump vec2 vTex;
uniform lowp sampler2D samplerFront;
uniform lowp sampler2D samplerBack;
uniform mediump vec2 destStart;
uniform mediump vec2 destEnd;

void main(void)
{
	// Retrieve front and back pixels and unpremultiply
	lowp vec4 front = texture2D(samplerFront, vTex);
	front.rgb /= front.a;
	lowp vec4 back = texture2D(samplerBack, mix(destStart, destEnd, vTex));
	back.rgb /= back.a;
	
	// Divide back by front and premultiply
    front.rgb = min(back.rgb / front.rgb, vec3(1.0, 1.0, 1.0)) * front.a;
	
	gl_FragColor = front * back.a;
}
