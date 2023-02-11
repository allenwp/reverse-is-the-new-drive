shader_type spatial;
uniform sampler2D tex_frg_2;
render_mode unshaded;

void fragment() {
// Texture2D:2
	vec4 n_out2p0 = texture(tex_frg_2, UV);
// Output:0
	ALBEDO = vec3(n_out2p0.xyz);
}
