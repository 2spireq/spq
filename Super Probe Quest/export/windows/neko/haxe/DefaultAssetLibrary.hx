#if !lime_hybrid


package;


import haxe.Timer;
import haxe.Unserializer;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.MovieClip;
import openfl.events.Event;
import openfl.text.Font;
import openfl.media.Sound;
import openfl.net.URLRequest;
import openfl.utils.ByteArray;
import openfl.Assets;

#if neko
import neko.vm.Deque;
import neko.vm.Thread;
#elseif cpp
import cpp.vm.Deque;
import cpp.vm.Thread;
#end

#if sys
import sys.FileSystem;
#end

#if ios
import openfl._legacy.utils.SystemPath;
#end


@:access(openfl.media.Sound)
class DefaultAssetLibrary extends AssetLibrary {
	
	
	private static var loaded = 0;
	private static var loading = 0;
	private static var workerIncomingQueue = new Deque<Dynamic> ();
	private static var workerResult = new Deque<Dynamic> ();
	private static var workerThread:Thread;
	
	public var className (default, null) = new Map <String, Dynamic> ();
	public var path (default, null) = new Map <String, String> ();
	public var type (default, null) = new Map <String, AssetType> ();
	
	private var lastModified:Float;
	private var timer:Timer;
	
	
	public function new () {
		
		super ();
		
		
		
		
		
		
		Font.registerFont (__ASSET__assets_fonts_oratorstd_otf);
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		Font.registerFont (__ASSET__assets_fonts_nokiafc22_ttf);
		Font.registerFont (__ASSET__assets_fonts_arial_ttf);
		
		
		#if (windows || mac || linux)
		
		var useManifest = false;
		
		className.set ("assets/data/alicemap.oep", __ASSET__assets_data_alicemap_oep);
		type.set ("assets/data/alicemap.oep", AssetType.TEXT);
		
		className.set ("assets/data/maze.oel", __ASSET__assets_data_maze_oel);
		type.set ("assets/data/maze.oel", AssetType.TEXT);
		
		className.set ("assets/data/plats.oel", __ASSET__assets_data_plats_oel);
		type.set ("assets/data/plats.oel", AssetType.TEXT);
		
		className.set ("assets/data/rtgmap.oep", __ASSET__assets_data_rtgmap_oep);
		type.set ("assets/data/rtgmap.oep", AssetType.TEXT);
		
		className.set ("assets/fonts/OratorStd.otf", __ASSET__assets_fonts_oratorstd_otf);
		type.set ("assets/fonts/OratorStd.otf", AssetType.FONT);
		
		className.set ("assets/images/!originals/bt_orig/comp_alice_alt.png", __ASSET__assets_images__originals_bt_orig_comp_alice_alt_png);
		type.set ("assets/images/!originals/bt_orig/comp_alice_alt.png", AssetType.IMAGE);
		
		className.set ("assets/images/!originals/bt_orig/comp_alice_hover.png", __ASSET__assets_images__originals_bt_orig_comp_alice_hover_png);
		type.set ("assets/images/!originals/bt_orig/comp_alice_hover.png", AssetType.IMAGE);
		
		className.set ("assets/images/!originals/bt_orig/comp_lorri_alt.png", __ASSET__assets_images__originals_bt_orig_comp_lorri_alt_png);
		type.set ("assets/images/!originals/bt_orig/comp_lorri_alt.png", AssetType.IMAGE);
		
		className.set ("assets/images/!originals/bt_orig/comp_lorri_hover.png", __ASSET__assets_images__originals_bt_orig_comp_lorri_hover_png);
		type.set ("assets/images/!originals/bt_orig/comp_lorri_hover.png", AssetType.IMAGE);
		
		className.set ("assets/images/!originals/bt_orig/comp_pepssi_alt.png", __ASSET__assets_images__originals_bt_orig_comp_pepssi_alt_png);
		type.set ("assets/images/!originals/bt_orig/comp_pepssi_alt.png", AssetType.IMAGE);
		
		className.set ("assets/images/!originals/bt_orig/comp_pepssi_hover.png", __ASSET__assets_images__originals_bt_orig_comp_pepssi_hover_png);
		type.set ("assets/images/!originals/bt_orig/comp_pepssi_hover.png", AssetType.IMAGE);
		
		className.set ("assets/images/!originals/bt_orig/comp_ralph_alt.png", __ASSET__assets_images__originals_bt_orig_comp_ralph_alt_png);
		type.set ("assets/images/!originals/bt_orig/comp_ralph_alt.png", AssetType.IMAGE);
		
		className.set ("assets/images/!originals/bt_orig/comp_ralph_hover.png", __ASSET__assets_images__originals_bt_orig_comp_ralph_hover_png);
		type.set ("assets/images/!originals/bt_orig/comp_ralph_hover.png", AssetType.IMAGE);
		
		className.set ("assets/images/!originals/intro_originals/beach.pdn", __ASSET__assets_images__originals_intro_originals_beach_pdn);
		type.set ("assets/images/!originals/intro_originals/beach.pdn", AssetType.TEXT);
		
		className.set ("assets/images/!originals/intro_originals/Untitled.pdn", __ASSET__assets_images__originals_intro_originals_untitled_pdn);
		type.set ("assets/images/!originals/intro_originals/Untitled.pdn", AssetType.TEXT);
		
		className.set ("assets/images/!originals/intro_originals/vab.pdn", __ASSET__assets_images__originals_intro_originals_vab_pdn);
		type.set ("assets/images/!originals/intro_originals/vab.pdn", AssetType.TEXT);
		
		className.set ("assets/images/!originals/launchblock_other/nh-atlas-v.pdn", __ASSET__assets_images__originals_launchblock_other_nh_atlas_v_pdn);
		type.set ("assets/images/!originals/launchblock_other/nh-atlas-v.pdn", AssetType.TEXT);
		
		className.set ("assets/images/!originals/launchblock_other/nh-launch-block/Atlas_V_551_with_New_Horizons_on_Launch_Pad_41.jpg", __ASSET__assets_images__originals_launchblock_other_nh_launch_block_atlas_v_551_with_new_horizons_on_launch_pad_41_jpg);
		type.set ("assets/images/!originals/launchblock_other/nh-launch-block/Atlas_V_551_with_New_Horizons_on_Launch_Pad_41.jpg", AssetType.IMAGE);
		
		className.set ("assets/images/!originals/launchblock_other/nh-launch-block/nh-static-atlasv-launch.jpg", __ASSET__assets_images__originals_launchblock_other_nh_launch_block_nh_static_atlasv_launch_jpg);
		type.set ("assets/images/!originals/launchblock_other/nh-launch-block/nh-static-atlasv-launch.jpg", AssetType.IMAGE);
		
		className.set ("assets/images/!originals/launchblock_other/nh-launch-block.pdn", __ASSET__assets_images__originals_launchblock_other_nh_launch_block_pdn);
		type.set ("assets/images/!originals/launchblock_other/nh-launch-block.pdn", AssetType.TEXT);
		
		className.set ("assets/images/!originals/launchblock_other/nh-launch-block.png", __ASSET__assets_images__originals_launchblock_other_nh_launch_block_png);
		type.set ("assets/images/!originals/launchblock_other/nh-launch-block.png", AssetType.IMAGE);
		
		className.set ("assets/images/!originals/launchblock_other/nh-launch-long - Copy.pdn", __ASSET__assets_images__originals_launchblock_other_nh_launch_long___copy_pdn);
		type.set ("assets/images/!originals/launchblock_other/nh-launch-long - Copy.pdn", AssetType.TEXT);
		
		className.set ("assets/images/!originals/launchblock_other/nh-launch-long-old.pdn", __ASSET__assets_images__originals_launchblock_other_nh_launch_long_old_pdn);
		type.set ("assets/images/!originals/launchblock_other/nh-launch-long-old.pdn", AssetType.TEXT);
		
		className.set ("assets/images/!originals/launchblock_other/nh-launch-long.pdn", __ASSET__assets_images__originals_launchblock_other_nh_launch_long_pdn);
		type.set ("assets/images/!originals/launchblock_other/nh-launch-long.pdn", AssetType.TEXT);
		
		className.set ("assets/images/!originals/launchblock_other/nh-launch-long.png", __ASSET__assets_images__originals_launchblock_other_nh_launch_long_png);
		type.set ("assets/images/!originals/launchblock_other/nh-launch-long.png", AssetType.IMAGE);
		
		className.set ("assets/images/!originals/launchblock_other/nh-pastel.png", __ASSET__assets_images__originals_launchblock_other_nh_pastel_png);
		type.set ("assets/images/!originals/launchblock_other/nh-pastel.png", AssetType.IMAGE);
		
		className.set ("assets/images/!originals/launchblock_other/nh-postcard - Copy.pdn", __ASSET__assets_images__originals_launchblock_other_nh_postcard___copy_pdn);
		type.set ("assets/images/!originals/launchblock_other/nh-postcard - Copy.pdn", AssetType.TEXT);
		
		className.set ("assets/images/!originals/launchblock_other/nh-postcard - Copy.png", __ASSET__assets_images__originals_launchblock_other_nh_postcard___copy_png);
		type.set ("assets/images/!originals/launchblock_other/nh-postcard - Copy.png", AssetType.IMAGE);
		
		className.set ("assets/images/!originals/launchblock_other/nh-postcard.pdn", __ASSET__assets_images__originals_launchblock_other_nh_postcard_pdn);
		type.set ("assets/images/!originals/launchblock_other/nh-postcard.pdn", AssetType.TEXT);
		
		className.set ("assets/images/!originals/launchblock_other/nh-postcard.png", __ASSET__assets_images__originals_launchblock_other_nh_postcard_png);
		type.set ("assets/images/!originals/launchblock_other/nh-postcard.png", AssetType.IMAGE);
		
		className.set ("assets/images/!originals/launchblock_other/pad-norocket.pdn", __ASSET__assets_images__originals_launchblock_other_pad_norocket_pdn);
		type.set ("assets/images/!originals/launchblock_other/pad-norocket.pdn", AssetType.TEXT);
		
		className.set ("assets/images/!originals/launchblock_other/pad-rocket.pdn", __ASSET__assets_images__originals_launchblock_other_pad_rocket_pdn);
		type.set ("assets/images/!originals/launchblock_other/pad-rocket.pdn", AssetType.TEXT);
		
		className.set ("assets/images/!originals/splash/splash_x640.jpg", __ASSET__assets_images__originals_splash_splash_x640_jpg);
		type.set ("assets/images/!originals/splash/splash_x640.jpg", AssetType.IMAGE);
		
		className.set ("assets/images/!originals/splash/startup-splash-hero - Copy.png", __ASSET__assets_images__originals_splash_startup_splash_hero___copy_png);
		type.set ("assets/images/!originals/splash/startup-splash-hero - Copy.png", AssetType.IMAGE);
		
		className.set ("assets/images/!originals/splash/startup-splash-hero.png", __ASSET__assets_images__originals_splash_startup_splash_hero_png);
		type.set ("assets/images/!originals/splash/startup-splash-hero.png", AssetType.IMAGE);
		
		className.set ("assets/images/!originals/stemlogo.pdn", __ASSET__assets_images__originals_stemlogo_pdn);
		type.set ("assets/images/!originals/stemlogo.pdn", AssetType.TEXT);
		
		className.set ("assets/images/about/stemlogo.png", __ASSET__assets_images_about_stemlogo_png);
		type.set ("assets/images/about/stemlogo.png", AssetType.IMAGE);
		
		className.set ("assets/images/about/title_about.png", __ASSET__assets_images_about_title_about_png);
		type.set ("assets/images/about/title_about.png", AssetType.IMAGE);
		
		className.set ("assets/images/alicemaze/alice_hit.png", __ASSET__assets_images_alicemaze_alice_hit_png);
		type.set ("assets/images/alicemaze/alice_hit.png", AssetType.IMAGE);
		
		className.set ("assets/images/alicemaze/b-bottom.png", __ASSET__assets_images_alicemaze_b_bottom_png);
		type.set ("assets/images/alicemaze/b-bottom.png", AssetType.IMAGE);
		
		className.set ("assets/images/alicemaze/b-full.png", __ASSET__assets_images_alicemaze_b_full_png);
		type.set ("assets/images/alicemaze/b-full.png", AssetType.IMAGE);
		
		className.set ("assets/images/alicemaze/b-hori.png", __ASSET__assets_images_alicemaze_b_hori_png);
		type.set ("assets/images/alicemaze/b-hori.png", AssetType.IMAGE);
		
		className.set ("assets/images/alicemaze/b-island.png", __ASSET__assets_images_alicemaze_b_island_png);
		type.set ("assets/images/alicemaze/b-island.png", AssetType.IMAGE);
		
		className.set ("assets/images/alicemaze/b-lb.png", __ASSET__assets_images_alicemaze_b_lb_png);
		type.set ("assets/images/alicemaze/b-lb.png", AssetType.IMAGE);
		
		className.set ("assets/images/alicemaze/b-left.png", __ASSET__assets_images_alicemaze_b_left_png);
		type.set ("assets/images/alicemaze/b-left.png", AssetType.IMAGE);
		
		className.set ("assets/images/alicemaze/b-map.png", __ASSET__assets_images_alicemaze_b_map_png);
		type.set ("assets/images/alicemaze/b-map.png", AssetType.IMAGE);
		
		className.set ("assets/images/alicemaze/b-rb.png", __ASSET__assets_images_alicemaze_b_rb_png);
		type.set ("assets/images/alicemaze/b-rb.png", AssetType.IMAGE);
		
		className.set ("assets/images/alicemaze/b-right.png", __ASSET__assets_images_alicemaze_b_right_png);
		type.set ("assets/images/alicemaze/b-right.png", AssetType.IMAGE);
		
		className.set ("assets/images/alicemaze/b-top.png", __ASSET__assets_images_alicemaze_b_top_png);
		type.set ("assets/images/alicemaze/b-top.png", AssetType.IMAGE);
		
		className.set ("assets/images/alicemaze/b-ul.png", __ASSET__assets_images_alicemaze_b_ul_png);
		type.set ("assets/images/alicemaze/b-ul.png", AssetType.IMAGE);
		
		className.set ("assets/images/alicemaze/b-ur.png", __ASSET__assets_images_alicemaze_b_ur_png);
		type.set ("assets/images/alicemaze/b-ur.png", AssetType.IMAGE);
		
		className.set ("assets/images/alicemaze/b-vert.png", __ASSET__assets_images_alicemaze_b_vert_png);
		type.set ("assets/images/alicemaze/b-vert.png", AssetType.IMAGE);
		
		className.set ("assets/images/alicemaze/cleaner.png", __ASSET__assets_images_alicemaze_cleaner_png);
		type.set ("assets/images/alicemaze/cleaner.png", AssetType.IMAGE);
		
		className.set ("assets/images/alicemaze/dialogue/alice_dialogue_back.pdn", __ASSET__assets_images_alicemaze_dialogue_alice_dialogue_back_pdn);
		type.set ("assets/images/alicemaze/dialogue/alice_dialogue_back.pdn", AssetType.TEXT);
		
		className.set ("assets/images/alicemaze/dialogue/alice_dialogue_back.png", __ASSET__assets_images_alicemaze_dialogue_alice_dialogue_back_png);
		type.set ("assets/images/alicemaze/dialogue/alice_dialogue_back.png", AssetType.IMAGE);
		
		className.set ("assets/images/alicemaze/dialogue/OldManNormal.png", __ASSET__assets_images_alicemaze_dialogue_oldmannormal_png);
		type.set ("assets/images/alicemaze/dialogue/OldManNormal.png", AssetType.IMAGE);
		
		className.set ("assets/images/alicemaze/dialogue/speak0.png", __ASSET__assets_images_alicemaze_dialogue_speak0_png);
		type.set ("assets/images/alicemaze/dialogue/speak0.png", AssetType.IMAGE);
		
		className.set ("assets/images/alicemaze/dialogue/speak_0.png", __ASSET__assets_images_alicemaze_dialogue_speak_0_png);
		type.set ("assets/images/alicemaze/dialogue/speak_0.png", AssetType.IMAGE);
		
		className.set ("assets/images/alicemaze/dialogue/speak_template.png", __ASSET__assets_images_alicemaze_dialogue_speak_template_png);
		type.set ("assets/images/alicemaze/dialogue/speak_template.png", AssetType.IMAGE);
		
		className.set ("assets/images/alicemaze/dialogue/tag.png", __ASSET__assets_images_alicemaze_dialogue_tag_png);
		type.set ("assets/images/alicemaze/dialogue/tag.png", AssetType.IMAGE);
		
		className.set ("assets/images/alicemaze/dialogue/wasd/wasd_a.png", __ASSET__assets_images_alicemaze_dialogue_wasd_wasd_a_png);
		type.set ("assets/images/alicemaze/dialogue/wasd/wasd_a.png", AssetType.IMAGE);
		
		className.set ("assets/images/alicemaze/dialogue/wasd/wasd_d.png", __ASSET__assets_images_alicemaze_dialogue_wasd_wasd_d_png);
		type.set ("assets/images/alicemaze/dialogue/wasd/wasd_d.png", AssetType.IMAGE);
		
		className.set ("assets/images/alicemaze/dialogue/wasd/wasd_finger.pdn", __ASSET__assets_images_alicemaze_dialogue_wasd_wasd_finger_pdn);
		type.set ("assets/images/alicemaze/dialogue/wasd/wasd_finger.pdn", AssetType.TEXT);
		
		className.set ("assets/images/alicemaze/dialogue/wasd/wasd_s.pdn", __ASSET__assets_images_alicemaze_dialogue_wasd_wasd_s_pdn);
		type.set ("assets/images/alicemaze/dialogue/wasd/wasd_s.pdn", AssetType.TEXT);
		
		className.set ("assets/images/alicemaze/dialogue/wasd/wasd_s.png", __ASSET__assets_images_alicemaze_dialogue_wasd_wasd_s_png);
		type.set ("assets/images/alicemaze/dialogue/wasd/wasd_s.png", AssetType.IMAGE);
		
		className.set ("assets/images/alicemaze/dialogue/wasd/wasd_template.pdn", __ASSET__assets_images_alicemaze_dialogue_wasd_wasd_template_pdn);
		type.set ("assets/images/alicemaze/dialogue/wasd/wasd_template.pdn", AssetType.TEXT);
		
		className.set ("assets/images/alicemaze/dialogue/wasd/wasd_w.png", __ASSET__assets_images_alicemaze_dialogue_wasd_wasd_w_png);
		type.set ("assets/images/alicemaze/dialogue/wasd/wasd_w.png", AssetType.IMAGE);
		
		className.set ("assets/images/alicemaze/dialogue/wasd.png", __ASSET__assets_images_alicemaze_dialogue_wasd_png);
		type.set ("assets/images/alicemaze/dialogue/wasd.png", AssetType.IMAGE);
		
		className.set ("assets/images/alicemaze/player.png", __ASSET__assets_images_alicemaze_player_png);
		type.set ("assets/images/alicemaze/player.png", AssetType.IMAGE);
		
		className.set ("assets/images/component/buttonsprites/comp_alice_alt.png", __ASSET__assets_images_component_buttonsprites_comp_alice_alt_png);
		type.set ("assets/images/component/buttonsprites/comp_alice_alt.png", AssetType.IMAGE);
		
		className.set ("assets/images/component/buttonsprites/comp_alice_d.png", __ASSET__assets_images_component_buttonsprites_comp_alice_d_png);
		type.set ("assets/images/component/buttonsprites/comp_alice_d.png", AssetType.IMAGE);
		
		className.set ("assets/images/component/buttonsprites/comp_heat_alt.png", __ASSET__assets_images_component_buttonsprites_comp_heat_alt_png);
		type.set ("assets/images/component/buttonsprites/comp_heat_alt.png", AssetType.IMAGE);
		
		className.set ("assets/images/component/buttonsprites/comp_heat_d.png", __ASSET__assets_images_component_buttonsprites_comp_heat_d_png);
		type.set ("assets/images/component/buttonsprites/comp_heat_d.png", AssetType.IMAGE);
		
		className.set ("assets/images/component/buttonsprites/comp_lorri_alt.png", __ASSET__assets_images_component_buttonsprites_comp_lorri_alt_png);
		type.set ("assets/images/component/buttonsprites/comp_lorri_alt.png", AssetType.IMAGE);
		
		className.set ("assets/images/component/buttonsprites/comp_lorri_d.png", __ASSET__assets_images_component_buttonsprites_comp_lorri_d_png);
		type.set ("assets/images/component/buttonsprites/comp_lorri_d.png", AssetType.IMAGE);
		
		className.set ("assets/images/component/buttonsprites/comp_pepssi_alt.png", __ASSET__assets_images_component_buttonsprites_comp_pepssi_alt_png);
		type.set ("assets/images/component/buttonsprites/comp_pepssi_alt.png", AssetType.IMAGE);
		
		className.set ("assets/images/component/buttonsprites/comp_pepssi_d.png", __ASSET__assets_images_component_buttonsprites_comp_pepssi_d_png);
		type.set ("assets/images/component/buttonsprites/comp_pepssi_d.png", AssetType.IMAGE);
		
		className.set ("assets/images/component/buttonsprites/comp_ralph_alt.png", __ASSET__assets_images_component_buttonsprites_comp_ralph_alt_png);
		type.set ("assets/images/component/buttonsprites/comp_ralph_alt.png", AssetType.IMAGE);
		
		className.set ("assets/images/component/buttonsprites/comp_ralph_d.png", __ASSET__assets_images_component_buttonsprites_comp_ralph_d_png);
		type.set ("assets/images/component/buttonsprites/comp_ralph_d.png", AssetType.IMAGE);
		
		className.set ("assets/images/component/buttonsprites/comp_rex_alt.png", __ASSET__assets_images_component_buttonsprites_comp_rex_alt_png);
		type.set ("assets/images/component/buttonsprites/comp_rex_alt.png", AssetType.IMAGE);
		
		className.set ("assets/images/component/buttonsprites/comp_rex_d.png", __ASSET__assets_images_component_buttonsprites_comp_rex_d_png);
		type.set ("assets/images/component/buttonsprites/comp_rex_d.png", AssetType.IMAGE);
		
		className.set ("assets/images/component/buttonsprites/comp_rtg_alt.png", __ASSET__assets_images_component_buttonsprites_comp_rtg_alt_png);
		type.set ("assets/images/component/buttonsprites/comp_rtg_alt.png", AssetType.IMAGE);
		
		className.set ("assets/images/component/buttonsprites/comp_rtg_d.png", __ASSET__assets_images_component_buttonsprites_comp_rtg_d_png);
		type.set ("assets/images/component/buttonsprites/comp_rtg_d.png", AssetType.IMAGE);
		
		className.set ("assets/images/component/buttonsprites/comp_swap_alt.png", __ASSET__assets_images_component_buttonsprites_comp_swap_alt_png);
		type.set ("assets/images/component/buttonsprites/comp_swap_alt.png", AssetType.IMAGE);
		
		className.set ("assets/images/component/buttonsprites/comp_swap_d.png", __ASSET__assets_images_component_buttonsprites_comp_swap_d_png);
		type.set ("assets/images/component/buttonsprites/comp_swap_d.png", AssetType.IMAGE);
		
		className.set ("assets/images/component/buttonsprites/template.pdn", __ASSET__assets_images_component_buttonsprites_template_pdn);
		type.set ("assets/images/component/buttonsprites/template.pdn", AssetType.TEXT);
		
		className.set ("assets/images/component/comp_alice.png", __ASSET__assets_images_component_comp_alice_png);
		type.set ("assets/images/component/comp_alice.png", AssetType.IMAGE);
		
		className.set ("assets/images/component/comp_heatshield.png", __ASSET__assets_images_component_comp_heatshield_png);
		type.set ("assets/images/component/comp_heatshield.png", AssetType.IMAGE);
		
		className.set ("assets/images/component/comp_lorri.png", __ASSET__assets_images_component_comp_lorri_png);
		type.set ("assets/images/component/comp_lorri.png", AssetType.IMAGE);
		
		className.set ("assets/images/component/comp_pepssi.png", __ASSET__assets_images_component_comp_pepssi_png);
		type.set ("assets/images/component/comp_pepssi.png", AssetType.IMAGE);
		
		className.set ("assets/images/component/comp_ralph.png", __ASSET__assets_images_component_comp_ralph_png);
		type.set ("assets/images/component/comp_ralph.png", AssetType.IMAGE);
		
		className.set ("assets/images/component/comp_rex.png", __ASSET__assets_images_component_comp_rex_png);
		type.set ("assets/images/component/comp_rex.png", AssetType.IMAGE);
		
		className.set ("assets/images/component/comp_rtg.png", __ASSET__assets_images_component_comp_rtg_png);
		type.set ("assets/images/component/comp_rtg.png", AssetType.IMAGE);
		
		className.set ("assets/images/component/comp_swap.png", __ASSET__assets_images_component_comp_swap_png);
		type.set ("assets/images/component/comp_swap.png", AssetType.IMAGE);
		
		className.set ("assets/images/component/NH.png", __ASSET__assets_images_component_nh_png);
		type.set ("assets/images/component/NH.png", AssetType.IMAGE);
		
		className.set ("assets/images/component/nh_large.png", __ASSET__assets_images_component_nh_large_png);
		type.set ("assets/images/component/nh_large.png", AssetType.IMAGE);
		
		className.set ("assets/images/facts/fact0.png", __ASSET__assets_images_facts_fact0_png);
		type.set ("assets/images/facts/fact0.png", AssetType.IMAGE);
		
		className.set ("assets/images/facts/fact1.png", __ASSET__assets_images_facts_fact1_png);
		type.set ("assets/images/facts/fact1.png", AssetType.IMAGE);
		
		className.set ("assets/images/facts/fact2.png", __ASSET__assets_images_facts_fact2_png);
		type.set ("assets/images/facts/fact2.png", AssetType.IMAGE);
		
		className.set ("assets/images/facts/fact3.png", __ASSET__assets_images_facts_fact3_png);
		type.set ("assets/images/facts/fact3.png", AssetType.IMAGE);
		
		className.set ("assets/images/found/alice_button_backdrop.png", __ASSET__assets_images_found_alice_button_backdrop_png);
		type.set ("assets/images/found/alice_button_backdrop.png", AssetType.IMAGE);
		
		className.set ("assets/images/found/found_alice.png", __ASSET__assets_images_found_found_alice_png);
		type.set ("assets/images/found/found_alice.png", AssetType.IMAGE);
		
		className.set ("assets/images/found/found_alice_button.png", __ASSET__assets_images_found_found_alice_button_png);
		type.set ("assets/images/found/found_alice_button.png", AssetType.IMAGE);
		
		className.set ("assets/images/found/found_originals/alicefound.pdn", __ASSET__assets_images_found_found_originals_alicefound_pdn);
		type.set ("assets/images/found/found_originals/alicefound.pdn", AssetType.TEXT);
		
		className.set ("assets/images/found/found_originals/found-template.pdn", __ASSET__assets_images_found_found_originals_found_template_pdn);
		type.set ("assets/images/found/found_originals/found-template.pdn", AssetType.TEXT);
		
		className.set ("assets/images/found/found_originals/found_alice_button.pdn", __ASSET__assets_images_found_found_originals_found_alice_button_pdn);
		type.set ("assets/images/found/found_originals/found_alice_button.pdn", AssetType.TEXT);
		
		className.set ("assets/images/found/found_originals/rtg_found.pdn", __ASSET__assets_images_found_found_originals_rtg_found_pdn);
		type.set ("assets/images/found/found_originals/rtg_found.pdn", AssetType.TEXT);
		
		className.set ("assets/images/found/found_pepssi.png", __ASSET__assets_images_found_found_pepssi_png);
		type.set ("assets/images/found/found_pepssi.png", AssetType.IMAGE);
		
		className.set ("assets/images/found/found_pepssi_button.png", __ASSET__assets_images_found_found_pepssi_button_png);
		type.set ("assets/images/found/found_pepssi_button.png", AssetType.IMAGE);
		
		className.set ("assets/images/hub/alice_info.png", __ASSET__assets_images_hub_alice_info_png);
		type.set ("assets/images/hub/alice_info.png", AssetType.IMAGE);
		
		className.set ("assets/images/hub/blockout.png", __ASSET__assets_images_hub_blockout_png);
		type.set ("assets/images/hub/blockout.png", AssetType.IMAGE);
		
		className.set ("assets/images/hub/components_hero.png", __ASSET__assets_images_hub_components_hero_png);
		type.set ("assets/images/hub/components_hero.png", AssetType.IMAGE);
		
		className.set ("assets/images/hub/heat_info.png", __ASSET__assets_images_hub_heat_info_png);
		type.set ("assets/images/hub/heat_info.png", AssetType.IMAGE);
		
		className.set ("assets/images/hub/lorri_info.png", __ASSET__assets_images_hub_lorri_info_png);
		type.set ("assets/images/hub/lorri_info.png", AssetType.IMAGE);
		
		className.set ("assets/images/hub/pepssi_info.png", __ASSET__assets_images_hub_pepssi_info_png);
		type.set ("assets/images/hub/pepssi_info.png", AssetType.IMAGE);
		
		className.set ("assets/images/hub/ralph_info.png", __ASSET__assets_images_hub_ralph_info_png);
		type.set ("assets/images/hub/ralph_info.png", AssetType.IMAGE);
		
		className.set ("assets/images/hub/rex_info.png", __ASSET__assets_images_hub_rex_info_png);
		type.set ("assets/images/hub/rex_info.png", AssetType.IMAGE);
		
		className.set ("assets/images/hub/rtg_info.png", __ASSET__assets_images_hub_rtg_info_png);
		type.set ("assets/images/hub/rtg_info.png", AssetType.IMAGE);
		
		className.set ("assets/images/hub/swap_info.png", __ASSET__assets_images_hub_swap_info_png);
		type.set ("assets/images/hub/swap_info.png", AssetType.IMAGE);
		
		className.set ("assets/images/intro/beach.png", __ASSET__assets_images_intro_beach_png);
		type.set ("assets/images/intro/beach.png", AssetType.IMAGE);
		
		className.set ("assets/images/intro/name.png", __ASSET__assets_images_intro_name_png);
		type.set ("assets/images/intro/name.png", AssetType.IMAGE);
		
		className.set ("assets/images/intro/plane.png", __ASSET__assets_images_intro_plane_png);
		type.set ("assets/images/intro/plane.png", AssetType.IMAGE);
		
		className.set ("assets/images/intro/text0.png", __ASSET__assets_images_intro_text0_png);
		type.set ("assets/images/intro/text0.png", AssetType.IMAGE);
		
		className.set ("assets/images/intro/text1.png", __ASSET__assets_images_intro_text1_png);
		type.set ("assets/images/intro/text1.png", AssetType.IMAGE);
		
		className.set ("assets/images/intro/text2.png", __ASSET__assets_images_intro_text2_png);
		type.set ("assets/images/intro/text2.png", AssetType.IMAGE);
		
		className.set ("assets/images/intro/text3.png", __ASSET__assets_images_intro_text3_png);
		type.set ("assets/images/intro/text3.png", AssetType.IMAGE);
		
		className.set ("assets/images/intro/tower.png", __ASSET__assets_images_intro_tower_png);
		type.set ("assets/images/intro/tower.png", AssetType.IMAGE);
		
		className.set ("assets/images/intro/tutorial.png", __ASSET__assets_images_intro_tutorial_png);
		type.set ("assets/images/intro/tutorial.png", AssetType.IMAGE);
		
		className.set ("assets/images/intro/vab.png", __ASSET__assets_images_intro_vab_png);
		type.set ("assets/images/intro/vab.png", AssetType.IMAGE);
		
		className.set ("assets/images/launchblock/cloud0.png", __ASSET__assets_images_launchblock_cloud0_png);
		type.set ("assets/images/launchblock/cloud0.png", AssetType.IMAGE);
		
		className.set ("assets/images/launchblock/cloud1.png", __ASSET__assets_images_launchblock_cloud1_png);
		type.set ("assets/images/launchblock/cloud1.png", AssetType.IMAGE);
		
		className.set ("assets/images/launchblock/launch-thin-window.png", __ASSET__assets_images_launchblock_launch_thin_window_png);
		type.set ("assets/images/launchblock/launch-thin-window.png", AssetType.IMAGE);
		
		className.set ("assets/images/launchblock/launch-thin-window.png.meta", __ASSET__assets_images_launchblock_launch_thin_window_png_meta);
		type.set ("assets/images/launchblock/launch-thin-window.png.meta", AssetType.TEXT);
		
		className.set ("assets/images/launchblock/nh-atlas-v.pdn.meta", __ASSET__assets_images_launchblock_nh_atlas_v_pdn_meta);
		type.set ("assets/images/launchblock/nh-atlas-v.pdn.meta", AssetType.TEXT);
		
		className.set ("assets/images/launchblock/nh-launch-block.pdn.meta", __ASSET__assets_images_launchblock_nh_launch_block_pdn_meta);
		type.set ("assets/images/launchblock/nh-launch-block.pdn.meta", AssetType.TEXT);
		
		className.set ("assets/images/launchblock/nh-launch-block.png.meta", __ASSET__assets_images_launchblock_nh_launch_block_png_meta);
		type.set ("assets/images/launchblock/nh-launch-block.png.meta", AssetType.TEXT);
		
		className.set ("assets/images/launchblock/nh-launch-long - Copy.pdn.meta", __ASSET__assets_images_launchblock_nh_launch_long___copy_pdn_meta);
		type.set ("assets/images/launchblock/nh-launch-long - Copy.pdn.meta", AssetType.TEXT);
		
		className.set ("assets/images/launchblock/nh-launch-long-old.pdn.meta", __ASSET__assets_images_launchblock_nh_launch_long_old_pdn_meta);
		type.set ("assets/images/launchblock/nh-launch-long-old.pdn.meta", AssetType.TEXT);
		
		className.set ("assets/images/launchblock/nh-launch-long.pdn.meta", __ASSET__assets_images_launchblock_nh_launch_long_pdn_meta);
		type.set ("assets/images/launchblock/nh-launch-long.pdn.meta", AssetType.TEXT);
		
		className.set ("assets/images/launchblock/nh-launch-long.png.meta", __ASSET__assets_images_launchblock_nh_launch_long_png_meta);
		type.set ("assets/images/launchblock/nh-launch-long.png.meta", AssetType.TEXT);
		
		className.set ("assets/images/launchblock/nh-pastel.png.meta", __ASSET__assets_images_launchblock_nh_pastel_png_meta);
		type.set ("assets/images/launchblock/nh-pastel.png.meta", AssetType.TEXT);
		
		className.set ("assets/images/launchblock/nh-postcard - Copy - Copy.png.meta", __ASSET__assets_images_launchblock_nh_postcard___copy___copy_png_meta);
		type.set ("assets/images/launchblock/nh-postcard - Copy - Copy.png.meta", AssetType.TEXT);
		
		className.set ("assets/images/launchblock/nh-postcard - Copy.pdn.meta", __ASSET__assets_images_launchblock_nh_postcard___copy_pdn_meta);
		type.set ("assets/images/launchblock/nh-postcard - Copy.pdn.meta", AssetType.TEXT);
		
		className.set ("assets/images/launchblock/nh-postcard - Copy.png.meta", __ASSET__assets_images_launchblock_nh_postcard___copy_png_meta);
		type.set ("assets/images/launchblock/nh-postcard - Copy.png.meta", AssetType.TEXT);
		
		className.set ("assets/images/launchblock/nh-postcard-skeu.png.meta", __ASSET__assets_images_launchblock_nh_postcard_skeu_png_meta);
		type.set ("assets/images/launchblock/nh-postcard-skeu.png.meta", AssetType.TEXT);
		
		className.set ("assets/images/launchblock/nh-postcard.pdn.meta", __ASSET__assets_images_launchblock_nh_postcard_pdn_meta);
		type.set ("assets/images/launchblock/nh-postcard.pdn.meta", AssetType.TEXT);
		
		className.set ("assets/images/launchblock/nh-postcard.png.meta", __ASSET__assets_images_launchblock_nh_postcard_png_meta);
		type.set ("assets/images/launchblock/nh-postcard.png.meta", AssetType.TEXT);
		
		className.set ("assets/images/launchblock/pad-norocket.png", __ASSET__assets_images_launchblock_pad_norocket_png);
		type.set ("assets/images/launchblock/pad-norocket.png", AssetType.IMAGE);
		
		className.set ("assets/images/launchblock/pad-rocket.png", __ASSET__assets_images_launchblock_pad_rocket_png);
		type.set ("assets/images/launchblock/pad-rocket.png", AssetType.IMAGE);
		
		className.set ("assets/images/launchblock/skyback - Copy.png", __ASSET__assets_images_launchblock_skyback___copy_png);
		type.set ("assets/images/launchblock/skyback - Copy.png", AssetType.IMAGE);
		
		className.set ("assets/images/launchblock/skyback.png", __ASSET__assets_images_launchblock_skyback_png);
		type.set ("assets/images/launchblock/skyback.png", AssetType.IMAGE);
		
		className.set ("assets/images/logo.png", __ASSET__assets_images_logo_png);
		type.set ("assets/images/logo.png", AssetType.IMAGE);
		
		className.set ("assets/images/logoflicker.png", __ASSET__assets_images_logoflicker_png);
		type.set ("assets/images/logoflicker.png", AssetType.IMAGE);
		
		className.set ("assets/images/menu/button originals/buttontemplate - Copy.pdn", __ASSET__assets_images_menu_button_originals_buttontemplate___copy_pdn);
		type.set ("assets/images/menu/button originals/buttontemplate - Copy.pdn", AssetType.TEXT);
		
		className.set ("assets/images/menu/button originals/button_begin.pdn", __ASSET__assets_images_menu_button_originals_button_begin_pdn);
		type.set ("assets/images/menu/button originals/button_begin.pdn", AssetType.TEXT);
		
		className.set ("assets/images/menu/button originals/button_mute.pdn", __ASSET__assets_images_menu_button_originals_button_mute_pdn);
		type.set ("assets/images/menu/button originals/button_mute.pdn", AssetType.TEXT);
		
		className.set ("assets/images/menu/button originals/button_pad.pdn", __ASSET__assets_images_menu_button_originals_button_pad_pdn);
		type.set ("assets/images/menu/button originals/button_pad.pdn", AssetType.TEXT);
		
		className.set ("assets/images/menu/button originals/button_quit.pdn", __ASSET__assets_images_menu_button_originals_button_quit_pdn);
		type.set ("assets/images/menu/button originals/button_quit.pdn", AssetType.TEXT);
		
		className.set ("assets/images/menu/button originals/button_settings.pdn", __ASSET__assets_images_menu_button_originals_button_settings_pdn);
		type.set ("assets/images/menu/button originals/button_settings.pdn", AssetType.TEXT);
		
		className.set ("assets/images/menu/button originals/d_warning.pdn", __ASSET__assets_images_menu_button_originals_d_warning_pdn);
		type.set ("assets/images/menu/button originals/d_warning.pdn", AssetType.TEXT);
		
		className.set ("assets/images/menu/buttontemplate.pdn", __ASSET__assets_images_menu_buttontemplate_pdn);
		type.set ("assets/images/menu/buttontemplate.pdn", AssetType.TEXT);
		
		className.set ("assets/images/menu/button_about.png", __ASSET__assets_images_menu_button_about_png);
		type.set ("assets/images/menu/button_about.png", AssetType.IMAGE);
		
		className.set ("assets/images/menu/button_back.png", __ASSET__assets_images_menu_button_back_png);
		type.set ("assets/images/menu/button_back.png", AssetType.IMAGE);
		
		className.set ("assets/images/menu/button_begin.png", __ASSET__assets_images_menu_button_begin_png);
		type.set ("assets/images/menu/button_begin.png", AssetType.IMAGE);
		
		className.set ("assets/images/menu/button_debug.png", __ASSET__assets_images_menu_button_debug_png);
		type.set ("assets/images/menu/button_debug.png", AssetType.IMAGE);
		
		className.set ("assets/images/menu/button_f.png", __ASSET__assets_images_menu_button_f_png);
		type.set ("assets/images/menu/button_f.png", AssetType.IMAGE);
		
		className.set ("assets/images/menu/button_facts.png", __ASSET__assets_images_menu_button_facts_png);
		type.set ("assets/images/menu/button_facts.png", AssetType.IMAGE);
		
		className.set ("assets/images/menu/button_full.png", __ASSET__assets_images_menu_button_full_png);
		type.set ("assets/images/menu/button_full.png", AssetType.IMAGE);
		
		className.set ("assets/images/menu/button_pad.png", __ASSET__assets_images_menu_button_pad_png);
		type.set ("assets/images/menu/button_pad.png", AssetType.IMAGE);
		
		className.set ("assets/images/menu/button_pluto.png", __ASSET__assets_images_menu_button_pluto_png);
		type.set ("assets/images/menu/button_pluto.png", AssetType.IMAGE);
		
		className.set ("assets/images/menu/button_quit.png", __ASSET__assets_images_menu_button_quit_png);
		type.set ("assets/images/menu/button_quit.png", AssetType.IMAGE);
		
		className.set ("assets/images/menu/button_rand.png", __ASSET__assets_images_menu_button_rand_png);
		type.set ("assets/images/menu/button_rand.png", AssetType.IMAGE);
		
		className.set ("assets/images/menu/button_setting.png", __ASSET__assets_images_menu_button_setting_png);
		type.set ("assets/images/menu/button_setting.png", AssetType.IMAGE);
		
		className.set ("assets/images/menu/button_settings.png", __ASSET__assets_images_menu_button_settings_png);
		type.set ("assets/images/menu/button_settings.png", AssetType.IMAGE);
		
		className.set ("assets/images/menu/coordsblock.png", __ASSET__assets_images_menu_coordsblock_png);
		type.set ("assets/images/menu/coordsblock.png", AssetType.IMAGE);
		
		className.set ("assets/images/menu/d_warning.png", __ASSET__assets_images_menu_d_warning_png);
		type.set ("assets/images/menu/d_warning.png", AssetType.IMAGE);
		
		className.set ("assets/images/menu/d_warn_cancel.png", __ASSET__assets_images_menu_d_warn_cancel_png);
		type.set ("assets/images/menu/d_warn_cancel.png", AssetType.IMAGE);
		
		className.set ("assets/images/menu/d_warn_ok.pdn", __ASSET__assets_images_menu_d_warn_ok_pdn);
		type.set ("assets/images/menu/d_warn_ok.pdn", AssetType.TEXT);
		
		className.set ("assets/images/menu/d_warn_ok.png", __ASSET__assets_images_menu_d_warn_ok_png);
		type.set ("assets/images/menu/d_warn_ok.png", AssetType.IMAGE);
		
		className.set ("assets/images/menu/full_exit_notice.png", __ASSET__assets_images_menu_full_exit_notice_png);
		type.set ("assets/images/menu/full_exit_notice.png", AssetType.IMAGE);
		
		className.set ("assets/images/menu/moons/CharonOrbit.png", __ASSET__assets_images_menu_moons_charonorbit_png);
		type.set ("assets/images/menu/moons/CharonOrbit.png", AssetType.IMAGE);
		
		className.set ("assets/images/menu/moons/HydraOrbit.png", __ASSET__assets_images_menu_moons_hydraorbit_png);
		type.set ("assets/images/menu/moons/HydraOrbit.png", AssetType.IMAGE);
		
		className.set ("assets/images/menu/moons/KerberosOrbit.png", __ASSET__assets_images_menu_moons_kerberosorbit_png);
		type.set ("assets/images/menu/moons/KerberosOrbit.png", AssetType.IMAGE);
		
		className.set ("assets/images/menu/moons/NixOrbit.png", __ASSET__assets_images_menu_moons_nixorbit_png);
		type.set ("assets/images/menu/moons/NixOrbit.png", AssetType.IMAGE);
		
		className.set ("assets/images/menu/moons/original/Charon.png", __ASSET__assets_images_menu_moons_original_charon_png);
		type.set ("assets/images/menu/moons/original/Charon.png", AssetType.IMAGE);
		
		className.set ("assets/images/menu/moons/original/Hydra.png", __ASSET__assets_images_menu_moons_original_hydra_png);
		type.set ("assets/images/menu/moons/original/Hydra.png", AssetType.IMAGE);
		
		className.set ("assets/images/menu/moons/original/Kerberos.png", __ASSET__assets_images_menu_moons_original_kerberos_png);
		type.set ("assets/images/menu/moons/original/Kerberos.png", AssetType.IMAGE);
		
		className.set ("assets/images/menu/moons/original/Nix.png", __ASSET__assets_images_menu_moons_original_nix_png);
		type.set ("assets/images/menu/moons/original/Nix.png", AssetType.IMAGE);
		
		className.set ("assets/images/menu/moons/original/Styx.png", __ASSET__assets_images_menu_moons_original_styx_png);
		type.set ("assets/images/menu/moons/original/Styx.png", AssetType.IMAGE);
		
		className.set ("assets/images/menu/moons/Pluto.png", __ASSET__assets_images_menu_moons_pluto_png);
		type.set ("assets/images/menu/moons/Pluto.png", AssetType.IMAGE);
		
		className.set ("assets/images/menu/moons/StyxOrbit.png", __ASSET__assets_images_menu_moons_styxorbit_png);
		type.set ("assets/images/menu/moons/StyxOrbit.png", AssetType.IMAGE);
		
		className.set ("assets/images/menu/splash_x640.png", __ASSET__assets_images_menu_splash_x640_png);
		type.set ("assets/images/menu/splash_x640.png", AssetType.IMAGE);
		
		className.set ("assets/images/menu/starback.png", __ASSET__assets_images_menu_starback_png);
		type.set ("assets/images/menu/starback.png", AssetType.IMAGE);
		
		className.set ("assets/images/misc/320xp.pdn", __ASSET__assets_images_misc_320xp_pdn);
		type.set ("assets/images/misc/320xp.pdn", AssetType.TEXT);
		
		className.set ("assets/images/misc/320xp.png", __ASSET__assets_images_misc_320xp_png);
		type.set ("assets/images/misc/320xp.png", AssetType.IMAGE);
		
		className.set ("assets/images/misc/earth-32x.png", __ASSET__assets_images_misc_earth_32x_png);
		type.set ("assets/images/misc/earth-32x.png", AssetType.IMAGE);
		
		className.set ("assets/images/misc/pls.png", __ASSET__assets_images_misc_pls_png);
		type.set ("assets/images/misc/pls.png", AssetType.IMAGE);
		
		className.set ("assets/images/mute/Mute.png", __ASSET__assets_images_mute_mute_png);
		type.set ("assets/images/mute/Mute.png", AssetType.IMAGE);
		
		className.set ("assets/images/mute/MuteOn.png", __ASSET__assets_images_mute_muteon_png);
		type.set ("assets/images/mute/MuteOn.png", AssetType.IMAGE);
		
		className.set ("assets/images/NH.ico", __ASSET__assets_images_nh_ico);
		type.set ("assets/images/NH.ico", AssetType.BINARY);
		
		className.set ("assets/images/nh_large.svg", __ASSET__assets_images_nh_large_svg);
		type.set ("assets/images/nh_large.svg", AssetType.TEXT);
		
		className.set ("assets/images/pepssiwire/background.png", __ASSET__assets_images_pepssiwire_background_png);
		type.set ("assets/images/pepssiwire/background.png", AssetType.IMAGE);
		
		className.set ("assets/images/pepssiwire/bblue.png", __ASSET__assets_images_pepssiwire_bblue_png);
		type.set ("assets/images/pepssiwire/bblue.png", AssetType.IMAGE);
		
		className.set ("assets/images/pepssiwire/box - Copy.pdn", __ASSET__assets_images_pepssiwire_box___copy_pdn);
		type.set ("assets/images/pepssiwire/box - Copy.pdn", AssetType.TEXT);
		
		className.set ("assets/images/pepssiwire/box-mockup.pdn", __ASSET__assets_images_pepssiwire_box_mockup_pdn);
		type.set ("assets/images/pepssiwire/box-mockup.pdn", AssetType.TEXT);
		
		className.set ("assets/images/pepssiwire/box-mockup.png", __ASSET__assets_images_pepssiwire_box_mockup_png);
		type.set ("assets/images/pepssiwire/box-mockup.png", AssetType.IMAGE);
		
		className.set ("assets/images/pepssiwire/box.pdn", __ASSET__assets_images_pepssiwire_box_pdn);
		type.set ("assets/images/pepssiwire/box.pdn", AssetType.TEXT);
		
		className.set ("assets/images/pepssiwire/box.png", __ASSET__assets_images_pepssiwire_box_png);
		type.set ("assets/images/pepssiwire/box.png", AssetType.IMAGE);
		
		className.set ("assets/images/pepssiwire/bparcel.png", __ASSET__assets_images_pepssiwire_bparcel_png);
		type.set ("assets/images/pepssiwire/bparcel.png", AssetType.IMAGE);
		
		className.set ("assets/images/pepssiwire/bpeach.png", __ASSET__assets_images_pepssiwire_bpeach_png);
		type.set ("assets/images/pepssiwire/bpeach.png", AssetType.IMAGE);
		
		className.set ("assets/images/pepssiwire/bpink.png", __ASSET__assets_images_pepssiwire_bpink_png);
		type.set ("assets/images/pepssiwire/bpink.png", AssetType.IMAGE);
		
		className.set ("assets/images/pepssiwire/colors.png", __ASSET__assets_images_pepssiwire_colors_png);
		type.set ("assets/images/pepssiwire/colors.png", AssetType.IMAGE);
		
		className.set ("assets/images/pepssiwire/dialogback.png", __ASSET__assets_images_pepssiwire_dialogback_png);
		type.set ("assets/images/pepssiwire/dialogback.png", AssetType.IMAGE);
		
		className.set ("assets/images/pepssiwire/dialogtext.png", __ASSET__assets_images_pepssiwire_dialogtext_png);
		type.set ("assets/images/pepssiwire/dialogtext.png", AssetType.IMAGE);
		
		className.set ("assets/images/pepssiwire/old/0bluealt.png", __ASSET__assets_images_pepssiwire_old_0bluealt_png);
		type.set ("assets/images/pepssiwire/old/0bluealt.png", AssetType.IMAGE);
		
		className.set ("assets/images/pepssiwire/old/0limealt.png", __ASSET__assets_images_pepssiwire_old_0limealt_png);
		type.set ("assets/images/pepssiwire/old/0limealt.png", AssetType.IMAGE);
		
		className.set ("assets/images/pepssiwire/old/0peachalt.png", __ASSET__assets_images_pepssiwire_old_0peachalt_png);
		type.set ("assets/images/pepssiwire/old/0peachalt.png", AssetType.IMAGE);
		
		className.set ("assets/images/pepssiwire/old/0pinkalt.png", __ASSET__assets_images_pepssiwire_old_0pinkalt_png);
		type.set ("assets/images/pepssiwire/old/0pinkalt.png", AssetType.IMAGE);
		
		className.set ("assets/images/pepssiwire/old/1bluealt.png", __ASSET__assets_images_pepssiwire_old_1bluealt_png);
		type.set ("assets/images/pepssiwire/old/1bluealt.png", AssetType.IMAGE);
		
		className.set ("assets/images/pepssiwire/old/1limealt.png", __ASSET__assets_images_pepssiwire_old_1limealt_png);
		type.set ("assets/images/pepssiwire/old/1limealt.png", AssetType.IMAGE);
		
		className.set ("assets/images/pepssiwire/old/1peachalt.png", __ASSET__assets_images_pepssiwire_old_1peachalt_png);
		type.set ("assets/images/pepssiwire/old/1peachalt.png", AssetType.IMAGE);
		
		className.set ("assets/images/pepssiwire/old/1pinkalt.png", __ASSET__assets_images_pepssiwire_old_1pinkalt_png);
		type.set ("assets/images/pepssiwire/old/1pinkalt.png", AssetType.IMAGE);
		
		className.set ("assets/images/pepssiwire/original/0blue.png", __ASSET__assets_images_pepssiwire_original_0blue_png);
		type.set ("assets/images/pepssiwire/original/0blue.png", AssetType.IMAGE);
		
		className.set ("assets/images/pepssiwire/original/0lime.png", __ASSET__assets_images_pepssiwire_original_0lime_png);
		type.set ("assets/images/pepssiwire/original/0lime.png", AssetType.IMAGE);
		
		className.set ("assets/images/pepssiwire/original/0peach.png", __ASSET__assets_images_pepssiwire_original_0peach_png);
		type.set ("assets/images/pepssiwire/original/0peach.png", AssetType.IMAGE);
		
		className.set ("assets/images/pepssiwire/original/0pink.png", __ASSET__assets_images_pepssiwire_original_0pink_png);
		type.set ("assets/images/pepssiwire/original/0pink.png", AssetType.IMAGE);
		
		className.set ("assets/images/pepssiwire/parcel.pdn", __ASSET__assets_images_pepssiwire_parcel_pdn);
		type.set ("assets/images/pepssiwire/parcel.pdn", AssetType.TEXT);
		
		className.set ("assets/images/pepssiwire/parcel.png", __ASSET__assets_images_pepssiwire_parcel_png);
		type.set ("assets/images/pepssiwire/parcel.png", AssetType.IMAGE);
		
		className.set ("assets/images/pepssiwire/sgsgsg.pdn", __ASSET__assets_images_pepssiwire_sgsgsg_pdn);
		type.set ("assets/images/pepssiwire/sgsgsg.pdn", AssetType.TEXT);
		
		className.set ("assets/images/pepssiwire/Untitled.pdn", __ASSET__assets_images_pepssiwire_untitled_pdn);
		type.set ("assets/images/pepssiwire/Untitled.pdn", AssetType.TEXT);
		
		className.set ("assets/images/pepssiwire/Untitled.png", __ASSET__assets_images_pepssiwire_untitled_png);
		type.set ("assets/images/pepssiwire/Untitled.png", AssetType.IMAGE);
		
		className.set ("assets/images/reference.txt", __ASSET__assets_images_reference_txt);
		type.set ("assets/images/reference.txt", AssetType.TEXT);
		
		className.set ("assets/images/rtgrun/background.pdn", __ASSET__assets_images_rtgrun_background_pdn);
		type.set ("assets/images/rtgrun/background.pdn", AssetType.TEXT);
		
		className.set ("assets/images/rtgrun/background.png", __ASSET__assets_images_rtgrun_background_png);
		type.set ("assets/images/rtgrun/background.png", AssetType.IMAGE);
		
		className.set ("assets/images/rtgrun/clouds.png", __ASSET__assets_images_rtgrun_clouds_png);
		type.set ("assets/images/rtgrun/clouds.png", AssetType.IMAGE);
		
		className.set ("assets/images/rtgrun/mockup.pdn", __ASSET__assets_images_rtgrun_mockup_pdn);
		type.set ("assets/images/rtgrun/mockup.pdn", AssetType.TEXT);
		
		className.set ("assets/images/rtgrun/placeholder.pdn", __ASSET__assets_images_rtgrun_placeholder_pdn);
		type.set ("assets/images/rtgrun/placeholder.pdn", AssetType.TEXT);
		
		className.set ("assets/images/rtgrun/placeholder.png", __ASSET__assets_images_rtgrun_placeholder_png);
		type.set ("assets/images/rtgrun/placeholder.png", AssetType.IMAGE);
		
		className.set ("assets/images/rtgrun/sky.png", __ASSET__assets_images_rtgrun_sky_png);
		type.set ("assets/images/rtgrun/sky.png", AssetType.IMAGE);
		
		className.set ("assets/images/settings/button_fullscreen.png", __ASSET__assets_images_settings_button_fullscreen_png);
		type.set ("assets/images/settings/button_fullscreen.png", AssetType.IMAGE);
		
		className.set ("assets/images/settings/button_fullscreen_alt.png", __ASSET__assets_images_settings_button_fullscreen_alt_png);
		type.set ("assets/images/settings/button_fullscreen_alt.png", AssetType.IMAGE);
		
		className.set ("assets/images/settings/button_sound.png", __ASSET__assets_images_settings_button_sound_png);
		type.set ("assets/images/settings/button_sound.png", AssetType.IMAGE);
		
		className.set ("assets/images/settings/button_sound_alt.png", __ASSET__assets_images_settings_button_sound_alt_png);
		type.set ("assets/images/settings/button_sound_alt.png", AssetType.IMAGE);
		
		className.set ("assets/images/settings/originals/button_fullscreen.pdn", __ASSET__assets_images_settings_originals_button_fullscreen_pdn);
		type.set ("assets/images/settings/originals/button_fullscreen.pdn", AssetType.TEXT);
		
		className.set ("assets/images/settings/originals/button_sound.pdn", __ASSET__assets_images_settings_originals_button_sound_pdn);
		type.set ("assets/images/settings/originals/button_sound.pdn", AssetType.TEXT);
		
		className.set ("assets/images/settings/title_settings.png", __ASSET__assets_images_settings_title_settings_png);
		type.set ("assets/images/settings/title_settings.png", AssetType.IMAGE);
		
		className.set ("assets/music/menu-main2.wav", __ASSET__assets_music_menu_main2_wav);
		type.set ("assets/music/menu-main2.wav", AssetType.SOUND);
		
		className.set ("assets/music/music_credits.txt", __ASSET__assets_music_music_credits_txt);
		type.set ("assets/music/music_credits.txt", AssetType.TEXT);
		
		className.set ("assets/sounds/data.wav", __ASSET__assets_sounds_data_wav);
		type.set ("assets/sounds/data.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/error.wav", __ASSET__assets_sounds_error_wav);
		type.set ("assets/sounds/error.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/get.wav", __ASSET__assets_sounds_get_wav);
		type.set ("assets/sounds/get.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/introtone.mp3", __ASSET__assets_sounds_introtone_mp3);
		type.set ("assets/sounds/introtone.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/introtone.wav", __ASSET__assets_sounds_introtone_wav);
		type.set ("assets/sounds/introtone.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/Pickup_Coin.wav", __ASSET__assets_sounds_pickup_coin_wav);
		type.set ("assets/sounds/Pickup_Coin.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/select.wav", __ASSET__assets_sounds_select_wav);
		type.set ("assets/sounds/select.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/signal.wav", __ASSET__assets_sounds_signal_wav);
		type.set ("assets/sounds/signal.wav", AssetType.SOUND);
		useManifest = true;
		useManifest = true;
		
		className.set ("assets/fonts/nokiafc22.ttf", __ASSET__assets_fonts_nokiafc22_ttf);
		type.set ("assets/fonts/nokiafc22.ttf", AssetType.FONT);
		
		className.set ("assets/fonts/arial.ttf", __ASSET__assets_fonts_arial_ttf);
		type.set ("assets/fonts/arial.ttf", AssetType.FONT);
		
		
		if (useManifest) {
			
			loadManifest ();
			
			if (Sys.args ().indexOf ("-livereload") > -1) {
				
				var path = FileSystem.fullPath ("manifest");
				lastModified = FileSystem.stat (path).mtime.getTime ();
				
				timer = new Timer (2000);
				timer.run = function () {
					
					var modified = FileSystem.stat (path).mtime.getTime ();
					
					if (modified > lastModified) {
						
						lastModified = modified;
						loadManifest ();
						
						if (eventCallback != null) {
							
							eventCallback (this, "change");
							
						}
						
					}
					
				}
				
			}
			
		}
		
		#else
		
		loadManifest ();
		
		#end
		
	}
	
	
	public override function exists (id:String, type:AssetType):Bool {
		
		var assetType = this.type.get (id);
		
		if (assetType != null) {
			
			if (assetType == type || ((type == SOUND || type == MUSIC) && (assetType == MUSIC || assetType == SOUND))) {
				
				return true;
				
			}
			
			if (type == BINARY || type == null || (assetType == BINARY && type == TEXT)) {
				
				return true;
				
			}
			
		}
		
		return false;
		
	}
	
	
	public override function getBitmapData (id:String):BitmapData {
		
		if (className.exists (id)) {
			
			return cast (Type.createInstance (className.get (id), []), BitmapData);
			
		} else {
			
			return BitmapData.load (path.get (id));
			
		}
		
	}
	
	
	public override function getBytes (id:String):ByteArray {
		
		if (className.exists (id)) {
			
			return cast (Type.createInstance (className.get (id), []), ByteArray);
			
		} else {
			
			return ByteArray.readFile (path.get (id));
			
		}
		
	}
	
	
	public override function getFont (id:String):Font {
		
		if (className.exists (id)) {
			
			var fontClass = className.get (id);
			Font.registerFont (fontClass);
			return cast (Type.createInstance (fontClass, []), Font);
			
		} else {
			
			return new Font (path.get (id));
			
		}
		
	}
	
	
	public override function getMusic (id:String):Sound {
		
		if (className.exists (id)) {
			
			return cast (Type.createInstance (className.get (id), []), Sound);
			
		} else {
			
			return new Sound (new URLRequest (path.get (id)), null, true);
			
		}
		
	}
	
	
	public override function getPath (id:String):String {
		
		#if ios
		
		return SystemPath.applicationDirectory + "/assets/" + path.get (id);
		
		#else
		
		return path.get (id);
		
		#end
		
	}
	
	
	public override function getSound (id:String):Sound {
		
		if (className.exists (id)) {
			
			return cast (Type.createInstance (className.get (id), []), Sound);
			
		} else {
			
			return new Sound (new URLRequest (path.get (id)), null, type.get (id) == MUSIC);
			
		}
		
	}
	
	
	public override function getText (id:String):String {
		
		var bytes = getBytes (id);
		
		if (bytes == null) {
			
			return null;
			
		} else {
			
			return bytes.readUTFBytes (bytes.length);
			
		}
		
	}
	
	
	public override function isLocal (id:String, type:AssetType):Bool {
		
		return true;
		
	}
	
	
	public override function list (type:AssetType):Array<String> {
		
		var items = [];
		
		for (id in this.type.keys ()) {
			
			if (type == null || exists (id, type)) {
				
				items.push (id);
				
			}
			
		}
		
		return items;
		
	}
	
	
	public override function loadBitmapData (id:String, handler:BitmapData -> Void):Void {
		
		__load (getBitmapData, id, handler);
		
	}
	
	
	public override function loadBytes (id:String, handler:ByteArray -> Void):Void {
		
		__load (getBytes, id, handler);
		
	}
	
	
	public override function loadFont (id:String, handler:Font -> Void):Void {
		
		__load (getFont, id, handler);
		
	}
	
	
	private function loadManifest ():Void {
		
		try {
			
			#if blackberry
			var bytes = ByteArray.readFile ("app/native/manifest");
			#elseif tizen
			var bytes = ByteArray.readFile ("../res/manifest");
			#elseif emscripten
			var bytes = ByteArray.readFile ("assets/manifest");
			#else
			var bytes = ByteArray.readFile ("manifest");
			#end
			
			if (bytes != null) {
				
				bytes.position = 0;
				
				if (bytes.length > 0) {
					
					var data = bytes.readUTFBytes (bytes.length);
					
					if (data != null && data.length > 0) {
						
						var manifest:Array<Dynamic> = Unserializer.run (data);
						
						for (asset in manifest) {
							
							if (!className.exists (asset.id)) {
								
								path.set (asset.id, asset.path);
								type.set (asset.id, Type.createEnum (AssetType, asset.type));
								
							}
							
						}
						
					}
					
				}
				
			} else {
				
				trace ("Warning: Could not load asset manifest (bytes was null)");
				
			}
		
		} catch (e:Dynamic) {
			
			trace ('Warning: Could not load asset manifest (${e})');
			
		}
		
	}
	
	
	public override function loadMusic (id:String, handler:Sound -> Void):Void {
		
		__load (getMusic, id, handler);
		
	}
	
	
	public override function loadSound (id:String, handler:Sound -> Void):Void {
		
		__load (getSound, id, handler);
		
	}
	
	
	public override function loadText (id:String, handler:String -> Void):Void {
		
		var callback = function (bytes:ByteArray):Void {
			
			if (bytes == null) {
				
				handler (null);
				
			} else {
				
				handler (bytes.readUTFBytes (bytes.length));
				
			}
			
		}
		
		loadBytes (id, callback);
		
	}
	
	
	private static function __doWork ():Void {
		
		while (true) {
			
			var message = workerIncomingQueue.pop (true);
			
			if (message == "WORK") {
				
				var getMethod = workerIncomingQueue.pop (true);
				var id = workerIncomingQueue.pop (true);
				var handler = workerIncomingQueue.pop (true);
				
				var data = getMethod (id);
				workerResult.add ("RESULT");
				workerResult.add (data);
				workerResult.add (handler);
				
			} else if (message == "EXIT") {
				
				break;
				
			}
			
		}
		
	}
	
	
	private inline function __load<T> (getMethod:String->T, id:String, handler:T->Void):Void {
		
		workerIncomingQueue.add ("WORK");
		workerIncomingQueue.add (getMethod);
		workerIncomingQueue.add (id);
		workerIncomingQueue.add (handler);
		
		loading++;
		
	}
	
	
	public static function __poll ():Void {
		
		if (loading > loaded) {
			
			if (workerThread == null) {
				
				workerThread = Thread.create (__doWork);
				
			}
			
			var message = workerResult.pop (false);
			
			while (message == "RESULT") {
				
				loaded++;
				
				var data = workerResult.pop (true);
				var handler = workerResult.pop (true);
				
				if (handler != null) {
					
					handler (data);
					
				}
				
				message = workerResult.pop (false);
				
			}
			
		} else {
			
			if (workerThread != null) {
				
				workerIncomingQueue.add ("EXIT");
				workerThread = null;
				
			}
			
		}
		
	}
	
	
}


#if (windows || mac || linux)


@:file("assets/data/alicemap.oep") @:keep #if display private #end class __ASSET__assets_data_alicemap_oep extends flash.utils.ByteArray {}
@:file("assets/data/maze.oel") @:keep #if display private #end class __ASSET__assets_data_maze_oel extends flash.utils.ByteArray {}
@:file("assets/data/plats.oel") @:keep #if display private #end class __ASSET__assets_data_plats_oel extends flash.utils.ByteArray {}
@:file("assets/data/rtgmap.oep") @:keep #if display private #end class __ASSET__assets_data_rtgmap_oep extends flash.utils.ByteArray {}
@:font("assets/fonts/OratorStd.otf") @:keep #if display private #end class __ASSET__assets_fonts_oratorstd_otf extends flash.text.Font {}
@:bitmap("assets/images/!originals/bt_orig/comp_alice_alt.png") @:keep #if display private #end class __ASSET__assets_images__originals_bt_orig_comp_alice_alt_png extends flash.display.BitmapData {}
@:bitmap("assets/images/!originals/bt_orig/comp_alice_hover.png") @:keep #if display private #end class __ASSET__assets_images__originals_bt_orig_comp_alice_hover_png extends flash.display.BitmapData {}
@:bitmap("assets/images/!originals/bt_orig/comp_lorri_alt.png") @:keep #if display private #end class __ASSET__assets_images__originals_bt_orig_comp_lorri_alt_png extends flash.display.BitmapData {}
@:bitmap("assets/images/!originals/bt_orig/comp_lorri_hover.png") @:keep #if display private #end class __ASSET__assets_images__originals_bt_orig_comp_lorri_hover_png extends flash.display.BitmapData {}
@:bitmap("assets/images/!originals/bt_orig/comp_pepssi_alt.png") @:keep #if display private #end class __ASSET__assets_images__originals_bt_orig_comp_pepssi_alt_png extends flash.display.BitmapData {}
@:bitmap("assets/images/!originals/bt_orig/comp_pepssi_hover.png") @:keep #if display private #end class __ASSET__assets_images__originals_bt_orig_comp_pepssi_hover_png extends flash.display.BitmapData {}
@:bitmap("assets/images/!originals/bt_orig/comp_ralph_alt.png") @:keep #if display private #end class __ASSET__assets_images__originals_bt_orig_comp_ralph_alt_png extends flash.display.BitmapData {}
@:bitmap("assets/images/!originals/bt_orig/comp_ralph_hover.png") @:keep #if display private #end class __ASSET__assets_images__originals_bt_orig_comp_ralph_hover_png extends flash.display.BitmapData {}
@:file("assets/images/!originals/intro_originals/beach.pdn") @:keep #if display private #end class __ASSET__assets_images__originals_intro_originals_beach_pdn extends flash.utils.ByteArray {}
@:file("assets/images/!originals/intro_originals/Untitled.pdn") @:keep #if display private #end class __ASSET__assets_images__originals_intro_originals_untitled_pdn extends flash.utils.ByteArray {}
@:file("assets/images/!originals/intro_originals/vab.pdn") @:keep #if display private #end class __ASSET__assets_images__originals_intro_originals_vab_pdn extends flash.utils.ByteArray {}
@:file("assets/images/!originals/launchblock_other/nh-atlas-v.pdn") @:keep #if display private #end class __ASSET__assets_images__originals_launchblock_other_nh_atlas_v_pdn extends flash.utils.ByteArray {}
@:bitmap("assets/images/!originals/launchblock_other/nh-launch-block/Atlas_V_551_with_New_Horizons_on_Launch_Pad_41.jpg") @:keep #if display private #end class __ASSET__assets_images__originals_launchblock_other_nh_launch_block_atlas_v_551_with_new_horizons_on_launch_pad_41_jpg extends flash.display.BitmapData {}
@:bitmap("assets/images/!originals/launchblock_other/nh-launch-block/nh-static-atlasv-launch.jpg") @:keep #if display private #end class __ASSET__assets_images__originals_launchblock_other_nh_launch_block_nh_static_atlasv_launch_jpg extends flash.display.BitmapData {}
@:file("assets/images/!originals/launchblock_other/nh-launch-block.pdn") @:keep #if display private #end class __ASSET__assets_images__originals_launchblock_other_nh_launch_block_pdn extends flash.utils.ByteArray {}
@:bitmap("assets/images/!originals/launchblock_other/nh-launch-block.png") @:keep #if display private #end class __ASSET__assets_images__originals_launchblock_other_nh_launch_block_png extends flash.display.BitmapData {}
@:file("assets/images/!originals/launchblock_other/nh-launch-long - Copy.pdn") @:keep #if display private #end class __ASSET__assets_images__originals_launchblock_other_nh_launch_long___copy_pdn extends flash.utils.ByteArray {}
@:file("assets/images/!originals/launchblock_other/nh-launch-long-old.pdn") @:keep #if display private #end class __ASSET__assets_images__originals_launchblock_other_nh_launch_long_old_pdn extends flash.utils.ByteArray {}
@:file("assets/images/!originals/launchblock_other/nh-launch-long.pdn") @:keep #if display private #end class __ASSET__assets_images__originals_launchblock_other_nh_launch_long_pdn extends flash.utils.ByteArray {}
@:bitmap("assets/images/!originals/launchblock_other/nh-launch-long.png") @:keep #if display private #end class __ASSET__assets_images__originals_launchblock_other_nh_launch_long_png extends flash.display.BitmapData {}
@:bitmap("assets/images/!originals/launchblock_other/nh-pastel.png") @:keep #if display private #end class __ASSET__assets_images__originals_launchblock_other_nh_pastel_png extends flash.display.BitmapData {}
@:file("assets/images/!originals/launchblock_other/nh-postcard - Copy.pdn") @:keep #if display private #end class __ASSET__assets_images__originals_launchblock_other_nh_postcard___copy_pdn extends flash.utils.ByteArray {}
@:bitmap("assets/images/!originals/launchblock_other/nh-postcard - Copy.png") @:keep #if display private #end class __ASSET__assets_images__originals_launchblock_other_nh_postcard___copy_png extends flash.display.BitmapData {}
@:file("assets/images/!originals/launchblock_other/nh-postcard.pdn") @:keep #if display private #end class __ASSET__assets_images__originals_launchblock_other_nh_postcard_pdn extends flash.utils.ByteArray {}
@:bitmap("assets/images/!originals/launchblock_other/nh-postcard.png") @:keep #if display private #end class __ASSET__assets_images__originals_launchblock_other_nh_postcard_png extends flash.display.BitmapData {}
@:file("assets/images/!originals/launchblock_other/pad-norocket.pdn") @:keep #if display private #end class __ASSET__assets_images__originals_launchblock_other_pad_norocket_pdn extends flash.utils.ByteArray {}
@:file("assets/images/!originals/launchblock_other/pad-rocket.pdn") @:keep #if display private #end class __ASSET__assets_images__originals_launchblock_other_pad_rocket_pdn extends flash.utils.ByteArray {}
@:bitmap("assets/images/!originals/splash/splash_x640.jpg") @:keep #if display private #end class __ASSET__assets_images__originals_splash_splash_x640_jpg extends flash.display.BitmapData {}
@:bitmap("assets/images/!originals/splash/startup-splash-hero - Copy.png") @:keep #if display private #end class __ASSET__assets_images__originals_splash_startup_splash_hero___copy_png extends flash.display.BitmapData {}
@:bitmap("assets/images/!originals/splash/startup-splash-hero.png") @:keep #if display private #end class __ASSET__assets_images__originals_splash_startup_splash_hero_png extends flash.display.BitmapData {}
@:file("assets/images/!originals/stemlogo.pdn") @:keep #if display private #end class __ASSET__assets_images__originals_stemlogo_pdn extends flash.utils.ByteArray {}
@:bitmap("assets/images/about/stemlogo.png") @:keep #if display private #end class __ASSET__assets_images_about_stemlogo_png extends flash.display.BitmapData {}
@:bitmap("assets/images/about/title_about.png") @:keep #if display private #end class __ASSET__assets_images_about_title_about_png extends flash.display.BitmapData {}
@:bitmap("assets/images/alicemaze/alice_hit.png") @:keep #if display private #end class __ASSET__assets_images_alicemaze_alice_hit_png extends flash.display.BitmapData {}
@:bitmap("assets/images/alicemaze/b-bottom.png") @:keep #if display private #end class __ASSET__assets_images_alicemaze_b_bottom_png extends flash.display.BitmapData {}
@:bitmap("assets/images/alicemaze/b-full.png") @:keep #if display private #end class __ASSET__assets_images_alicemaze_b_full_png extends flash.display.BitmapData {}
@:bitmap("assets/images/alicemaze/b-hori.png") @:keep #if display private #end class __ASSET__assets_images_alicemaze_b_hori_png extends flash.display.BitmapData {}
@:bitmap("assets/images/alicemaze/b-island.png") @:keep #if display private #end class __ASSET__assets_images_alicemaze_b_island_png extends flash.display.BitmapData {}
@:bitmap("assets/images/alicemaze/b-lb.png") @:keep #if display private #end class __ASSET__assets_images_alicemaze_b_lb_png extends flash.display.BitmapData {}
@:bitmap("assets/images/alicemaze/b-left.png") @:keep #if display private #end class __ASSET__assets_images_alicemaze_b_left_png extends flash.display.BitmapData {}
@:bitmap("assets/images/alicemaze/b-map.png") @:keep #if display private #end class __ASSET__assets_images_alicemaze_b_map_png extends flash.display.BitmapData {}
@:bitmap("assets/images/alicemaze/b-rb.png") @:keep #if display private #end class __ASSET__assets_images_alicemaze_b_rb_png extends flash.display.BitmapData {}
@:bitmap("assets/images/alicemaze/b-right.png") @:keep #if display private #end class __ASSET__assets_images_alicemaze_b_right_png extends flash.display.BitmapData {}
@:bitmap("assets/images/alicemaze/b-top.png") @:keep #if display private #end class __ASSET__assets_images_alicemaze_b_top_png extends flash.display.BitmapData {}
@:bitmap("assets/images/alicemaze/b-ul.png") @:keep #if display private #end class __ASSET__assets_images_alicemaze_b_ul_png extends flash.display.BitmapData {}
@:bitmap("assets/images/alicemaze/b-ur.png") @:keep #if display private #end class __ASSET__assets_images_alicemaze_b_ur_png extends flash.display.BitmapData {}
@:bitmap("assets/images/alicemaze/b-vert.png") @:keep #if display private #end class __ASSET__assets_images_alicemaze_b_vert_png extends flash.display.BitmapData {}
@:bitmap("assets/images/alicemaze/cleaner.png") @:keep #if display private #end class __ASSET__assets_images_alicemaze_cleaner_png extends flash.display.BitmapData {}
@:file("assets/images/alicemaze/dialogue/alice_dialogue_back.pdn") @:keep #if display private #end class __ASSET__assets_images_alicemaze_dialogue_alice_dialogue_back_pdn extends flash.utils.ByteArray {}
@:bitmap("assets/images/alicemaze/dialogue/alice_dialogue_back.png") @:keep #if display private #end class __ASSET__assets_images_alicemaze_dialogue_alice_dialogue_back_png extends flash.display.BitmapData {}
@:bitmap("assets/images/alicemaze/dialogue/OldManNormal.png") @:keep #if display private #end class __ASSET__assets_images_alicemaze_dialogue_oldmannormal_png extends flash.display.BitmapData {}
@:bitmap("assets/images/alicemaze/dialogue/speak0.png") @:keep #if display private #end class __ASSET__assets_images_alicemaze_dialogue_speak0_png extends flash.display.BitmapData {}
@:bitmap("assets/images/alicemaze/dialogue/speak_0.png") @:keep #if display private #end class __ASSET__assets_images_alicemaze_dialogue_speak_0_png extends flash.display.BitmapData {}
@:bitmap("assets/images/alicemaze/dialogue/speak_template.png") @:keep #if display private #end class __ASSET__assets_images_alicemaze_dialogue_speak_template_png extends flash.display.BitmapData {}
@:bitmap("assets/images/alicemaze/dialogue/tag.png") @:keep #if display private #end class __ASSET__assets_images_alicemaze_dialogue_tag_png extends flash.display.BitmapData {}
@:bitmap("assets/images/alicemaze/dialogue/wasd/wasd_a.png") @:keep #if display private #end class __ASSET__assets_images_alicemaze_dialogue_wasd_wasd_a_png extends flash.display.BitmapData {}
@:bitmap("assets/images/alicemaze/dialogue/wasd/wasd_d.png") @:keep #if display private #end class __ASSET__assets_images_alicemaze_dialogue_wasd_wasd_d_png extends flash.display.BitmapData {}
@:file("assets/images/alicemaze/dialogue/wasd/wasd_finger.pdn") @:keep #if display private #end class __ASSET__assets_images_alicemaze_dialogue_wasd_wasd_finger_pdn extends flash.utils.ByteArray {}
@:file("assets/images/alicemaze/dialogue/wasd/wasd_s.pdn") @:keep #if display private #end class __ASSET__assets_images_alicemaze_dialogue_wasd_wasd_s_pdn extends flash.utils.ByteArray {}
@:bitmap("assets/images/alicemaze/dialogue/wasd/wasd_s.png") @:keep #if display private #end class __ASSET__assets_images_alicemaze_dialogue_wasd_wasd_s_png extends flash.display.BitmapData {}
@:file("assets/images/alicemaze/dialogue/wasd/wasd_template.pdn") @:keep #if display private #end class __ASSET__assets_images_alicemaze_dialogue_wasd_wasd_template_pdn extends flash.utils.ByteArray {}
@:bitmap("assets/images/alicemaze/dialogue/wasd/wasd_w.png") @:keep #if display private #end class __ASSET__assets_images_alicemaze_dialogue_wasd_wasd_w_png extends flash.display.BitmapData {}
@:bitmap("assets/images/alicemaze/dialogue/wasd.png") @:keep #if display private #end class __ASSET__assets_images_alicemaze_dialogue_wasd_png extends flash.display.BitmapData {}
@:bitmap("assets/images/alicemaze/player.png") @:keep #if display private #end class __ASSET__assets_images_alicemaze_player_png extends flash.display.BitmapData {}
@:bitmap("assets/images/component/buttonsprites/comp_alice_alt.png") @:keep #if display private #end class __ASSET__assets_images_component_buttonsprites_comp_alice_alt_png extends flash.display.BitmapData {}
@:bitmap("assets/images/component/buttonsprites/comp_alice_d.png") @:keep #if display private #end class __ASSET__assets_images_component_buttonsprites_comp_alice_d_png extends flash.display.BitmapData {}
@:bitmap("assets/images/component/buttonsprites/comp_heat_alt.png") @:keep #if display private #end class __ASSET__assets_images_component_buttonsprites_comp_heat_alt_png extends flash.display.BitmapData {}
@:bitmap("assets/images/component/buttonsprites/comp_heat_d.png") @:keep #if display private #end class __ASSET__assets_images_component_buttonsprites_comp_heat_d_png extends flash.display.BitmapData {}
@:bitmap("assets/images/component/buttonsprites/comp_lorri_alt.png") @:keep #if display private #end class __ASSET__assets_images_component_buttonsprites_comp_lorri_alt_png extends flash.display.BitmapData {}
@:bitmap("assets/images/component/buttonsprites/comp_lorri_d.png") @:keep #if display private #end class __ASSET__assets_images_component_buttonsprites_comp_lorri_d_png extends flash.display.BitmapData {}
@:bitmap("assets/images/component/buttonsprites/comp_pepssi_alt.png") @:keep #if display private #end class __ASSET__assets_images_component_buttonsprites_comp_pepssi_alt_png extends flash.display.BitmapData {}
@:bitmap("assets/images/component/buttonsprites/comp_pepssi_d.png") @:keep #if display private #end class __ASSET__assets_images_component_buttonsprites_comp_pepssi_d_png extends flash.display.BitmapData {}
@:bitmap("assets/images/component/buttonsprites/comp_ralph_alt.png") @:keep #if display private #end class __ASSET__assets_images_component_buttonsprites_comp_ralph_alt_png extends flash.display.BitmapData {}
@:bitmap("assets/images/component/buttonsprites/comp_ralph_d.png") @:keep #if display private #end class __ASSET__assets_images_component_buttonsprites_comp_ralph_d_png extends flash.display.BitmapData {}
@:bitmap("assets/images/component/buttonsprites/comp_rex_alt.png") @:keep #if display private #end class __ASSET__assets_images_component_buttonsprites_comp_rex_alt_png extends flash.display.BitmapData {}
@:bitmap("assets/images/component/buttonsprites/comp_rex_d.png") @:keep #if display private #end class __ASSET__assets_images_component_buttonsprites_comp_rex_d_png extends flash.display.BitmapData {}
@:bitmap("assets/images/component/buttonsprites/comp_rtg_alt.png") @:keep #if display private #end class __ASSET__assets_images_component_buttonsprites_comp_rtg_alt_png extends flash.display.BitmapData {}
@:bitmap("assets/images/component/buttonsprites/comp_rtg_d.png") @:keep #if display private #end class __ASSET__assets_images_component_buttonsprites_comp_rtg_d_png extends flash.display.BitmapData {}
@:bitmap("assets/images/component/buttonsprites/comp_swap_alt.png") @:keep #if display private #end class __ASSET__assets_images_component_buttonsprites_comp_swap_alt_png extends flash.display.BitmapData {}
@:bitmap("assets/images/component/buttonsprites/comp_swap_d.png") @:keep #if display private #end class __ASSET__assets_images_component_buttonsprites_comp_swap_d_png extends flash.display.BitmapData {}
@:file("assets/images/component/buttonsprites/template.pdn") @:keep #if display private #end class __ASSET__assets_images_component_buttonsprites_template_pdn extends flash.utils.ByteArray {}
@:bitmap("assets/images/component/comp_alice.png") @:keep #if display private #end class __ASSET__assets_images_component_comp_alice_png extends flash.display.BitmapData {}
@:bitmap("assets/images/component/comp_heatshield.png") @:keep #if display private #end class __ASSET__assets_images_component_comp_heatshield_png extends flash.display.BitmapData {}
@:bitmap("assets/images/component/comp_lorri.png") @:keep #if display private #end class __ASSET__assets_images_component_comp_lorri_png extends flash.display.BitmapData {}
@:bitmap("assets/images/component/comp_pepssi.png") @:keep #if display private #end class __ASSET__assets_images_component_comp_pepssi_png extends flash.display.BitmapData {}
@:bitmap("assets/images/component/comp_ralph.png") @:keep #if display private #end class __ASSET__assets_images_component_comp_ralph_png extends flash.display.BitmapData {}
@:bitmap("assets/images/component/comp_rex.png") @:keep #if display private #end class __ASSET__assets_images_component_comp_rex_png extends flash.display.BitmapData {}
@:bitmap("assets/images/component/comp_rtg.png") @:keep #if display private #end class __ASSET__assets_images_component_comp_rtg_png extends flash.display.BitmapData {}
@:bitmap("assets/images/component/comp_swap.png") @:keep #if display private #end class __ASSET__assets_images_component_comp_swap_png extends flash.display.BitmapData {}
@:bitmap("assets/images/component/NH.png") @:keep #if display private #end class __ASSET__assets_images_component_nh_png extends flash.display.BitmapData {}
@:bitmap("assets/images/component/nh_large.png") @:keep #if display private #end class __ASSET__assets_images_component_nh_large_png extends flash.display.BitmapData {}
@:bitmap("assets/images/facts/fact0.png") @:keep #if display private #end class __ASSET__assets_images_facts_fact0_png extends flash.display.BitmapData {}
@:bitmap("assets/images/facts/fact1.png") @:keep #if display private #end class __ASSET__assets_images_facts_fact1_png extends flash.display.BitmapData {}
@:bitmap("assets/images/facts/fact2.png") @:keep #if display private #end class __ASSET__assets_images_facts_fact2_png extends flash.display.BitmapData {}
@:bitmap("assets/images/facts/fact3.png") @:keep #if display private #end class __ASSET__assets_images_facts_fact3_png extends flash.display.BitmapData {}
@:bitmap("assets/images/found/alice_button_backdrop.png") @:keep #if display private #end class __ASSET__assets_images_found_alice_button_backdrop_png extends flash.display.BitmapData {}
@:bitmap("assets/images/found/found_alice.png") @:keep #if display private #end class __ASSET__assets_images_found_found_alice_png extends flash.display.BitmapData {}
@:bitmap("assets/images/found/found_alice_button.png") @:keep #if display private #end class __ASSET__assets_images_found_found_alice_button_png extends flash.display.BitmapData {}
@:file("assets/images/found/found_originals/alicefound.pdn") @:keep #if display private #end class __ASSET__assets_images_found_found_originals_alicefound_pdn extends flash.utils.ByteArray {}
@:file("assets/images/found/found_originals/found-template.pdn") @:keep #if display private #end class __ASSET__assets_images_found_found_originals_found_template_pdn extends flash.utils.ByteArray {}
@:file("assets/images/found/found_originals/found_alice_button.pdn") @:keep #if display private #end class __ASSET__assets_images_found_found_originals_found_alice_button_pdn extends flash.utils.ByteArray {}
@:file("assets/images/found/found_originals/rtg_found.pdn") @:keep #if display private #end class __ASSET__assets_images_found_found_originals_rtg_found_pdn extends flash.utils.ByteArray {}
@:bitmap("assets/images/found/found_pepssi.png") @:keep #if display private #end class __ASSET__assets_images_found_found_pepssi_png extends flash.display.BitmapData {}
@:bitmap("assets/images/found/found_pepssi_button.png") @:keep #if display private #end class __ASSET__assets_images_found_found_pepssi_button_png extends flash.display.BitmapData {}
@:bitmap("assets/images/hub/alice_info.png") @:keep #if display private #end class __ASSET__assets_images_hub_alice_info_png extends flash.display.BitmapData {}
@:bitmap("assets/images/hub/blockout.png") @:keep #if display private #end class __ASSET__assets_images_hub_blockout_png extends flash.display.BitmapData {}
@:bitmap("assets/images/hub/components_hero.png") @:keep #if display private #end class __ASSET__assets_images_hub_components_hero_png extends flash.display.BitmapData {}
@:bitmap("assets/images/hub/heat_info.png") @:keep #if display private #end class __ASSET__assets_images_hub_heat_info_png extends flash.display.BitmapData {}
@:bitmap("assets/images/hub/lorri_info.png") @:keep #if display private #end class __ASSET__assets_images_hub_lorri_info_png extends flash.display.BitmapData {}
@:bitmap("assets/images/hub/pepssi_info.png") @:keep #if display private #end class __ASSET__assets_images_hub_pepssi_info_png extends flash.display.BitmapData {}
@:bitmap("assets/images/hub/ralph_info.png") @:keep #if display private #end class __ASSET__assets_images_hub_ralph_info_png extends flash.display.BitmapData {}
@:bitmap("assets/images/hub/rex_info.png") @:keep #if display private #end class __ASSET__assets_images_hub_rex_info_png extends flash.display.BitmapData {}
@:bitmap("assets/images/hub/rtg_info.png") @:keep #if display private #end class __ASSET__assets_images_hub_rtg_info_png extends flash.display.BitmapData {}
@:bitmap("assets/images/hub/swap_info.png") @:keep #if display private #end class __ASSET__assets_images_hub_swap_info_png extends flash.display.BitmapData {}
@:bitmap("assets/images/intro/beach.png") @:keep #if display private #end class __ASSET__assets_images_intro_beach_png extends flash.display.BitmapData {}
@:bitmap("assets/images/intro/name.png") @:keep #if display private #end class __ASSET__assets_images_intro_name_png extends flash.display.BitmapData {}
@:bitmap("assets/images/intro/plane.png") @:keep #if display private #end class __ASSET__assets_images_intro_plane_png extends flash.display.BitmapData {}
@:bitmap("assets/images/intro/text0.png") @:keep #if display private #end class __ASSET__assets_images_intro_text0_png extends flash.display.BitmapData {}
@:bitmap("assets/images/intro/text1.png") @:keep #if display private #end class __ASSET__assets_images_intro_text1_png extends flash.display.BitmapData {}
@:bitmap("assets/images/intro/text2.png") @:keep #if display private #end class __ASSET__assets_images_intro_text2_png extends flash.display.BitmapData {}
@:bitmap("assets/images/intro/text3.png") @:keep #if display private #end class __ASSET__assets_images_intro_text3_png extends flash.display.BitmapData {}
@:bitmap("assets/images/intro/tower.png") @:keep #if display private #end class __ASSET__assets_images_intro_tower_png extends flash.display.BitmapData {}
@:bitmap("assets/images/intro/tutorial.png") @:keep #if display private #end class __ASSET__assets_images_intro_tutorial_png extends flash.display.BitmapData {}
@:bitmap("assets/images/intro/vab.png") @:keep #if display private #end class __ASSET__assets_images_intro_vab_png extends flash.display.BitmapData {}
@:bitmap("assets/images/launchblock/cloud0.png") @:keep #if display private #end class __ASSET__assets_images_launchblock_cloud0_png extends flash.display.BitmapData {}
@:bitmap("assets/images/launchblock/cloud1.png") @:keep #if display private #end class __ASSET__assets_images_launchblock_cloud1_png extends flash.display.BitmapData {}
@:bitmap("assets/images/launchblock/launch-thin-window.png") @:keep #if display private #end class __ASSET__assets_images_launchblock_launch_thin_window_png extends flash.display.BitmapData {}
@:file("assets/images/launchblock/launch-thin-window.png.meta") @:keep #if display private #end class __ASSET__assets_images_launchblock_launch_thin_window_png_meta extends flash.utils.ByteArray {}
@:file("assets/images/launchblock/nh-atlas-v.pdn.meta") @:keep #if display private #end class __ASSET__assets_images_launchblock_nh_atlas_v_pdn_meta extends flash.utils.ByteArray {}
@:file("assets/images/launchblock/nh-launch-block.pdn.meta") @:keep #if display private #end class __ASSET__assets_images_launchblock_nh_launch_block_pdn_meta extends flash.utils.ByteArray {}
@:file("assets/images/launchblock/nh-launch-block.png.meta") @:keep #if display private #end class __ASSET__assets_images_launchblock_nh_launch_block_png_meta extends flash.utils.ByteArray {}
@:file("assets/images/launchblock/nh-launch-long - Copy.pdn.meta") @:keep #if display private #end class __ASSET__assets_images_launchblock_nh_launch_long___copy_pdn_meta extends flash.utils.ByteArray {}
@:file("assets/images/launchblock/nh-launch-long-old.pdn.meta") @:keep #if display private #end class __ASSET__assets_images_launchblock_nh_launch_long_old_pdn_meta extends flash.utils.ByteArray {}
@:file("assets/images/launchblock/nh-launch-long.pdn.meta") @:keep #if display private #end class __ASSET__assets_images_launchblock_nh_launch_long_pdn_meta extends flash.utils.ByteArray {}
@:file("assets/images/launchblock/nh-launch-long.png.meta") @:keep #if display private #end class __ASSET__assets_images_launchblock_nh_launch_long_png_meta extends flash.utils.ByteArray {}
@:file("assets/images/launchblock/nh-pastel.png.meta") @:keep #if display private #end class __ASSET__assets_images_launchblock_nh_pastel_png_meta extends flash.utils.ByteArray {}
@:file("assets/images/launchblock/nh-postcard - Copy - Copy.png.meta") @:keep #if display private #end class __ASSET__assets_images_launchblock_nh_postcard___copy___copy_png_meta extends flash.utils.ByteArray {}
@:file("assets/images/launchblock/nh-postcard - Copy.pdn.meta") @:keep #if display private #end class __ASSET__assets_images_launchblock_nh_postcard___copy_pdn_meta extends flash.utils.ByteArray {}
@:file("assets/images/launchblock/nh-postcard - Copy.png.meta") @:keep #if display private #end class __ASSET__assets_images_launchblock_nh_postcard___copy_png_meta extends flash.utils.ByteArray {}
@:file("assets/images/launchblock/nh-postcard-skeu.png.meta") @:keep #if display private #end class __ASSET__assets_images_launchblock_nh_postcard_skeu_png_meta extends flash.utils.ByteArray {}
@:file("assets/images/launchblock/nh-postcard.pdn.meta") @:keep #if display private #end class __ASSET__assets_images_launchblock_nh_postcard_pdn_meta extends flash.utils.ByteArray {}
@:file("assets/images/launchblock/nh-postcard.png.meta") @:keep #if display private #end class __ASSET__assets_images_launchblock_nh_postcard_png_meta extends flash.utils.ByteArray {}
@:bitmap("assets/images/launchblock/pad-norocket.png") @:keep #if display private #end class __ASSET__assets_images_launchblock_pad_norocket_png extends flash.display.BitmapData {}
@:bitmap("assets/images/launchblock/pad-rocket.png") @:keep #if display private #end class __ASSET__assets_images_launchblock_pad_rocket_png extends flash.display.BitmapData {}
@:bitmap("assets/images/launchblock/skyback - Copy.png") @:keep #if display private #end class __ASSET__assets_images_launchblock_skyback___copy_png extends flash.display.BitmapData {}
@:bitmap("assets/images/launchblock/skyback.png") @:keep #if display private #end class __ASSET__assets_images_launchblock_skyback_png extends flash.display.BitmapData {}
@:bitmap("assets/images/logo.png") @:keep #if display private #end class __ASSET__assets_images_logo_png extends flash.display.BitmapData {}
@:bitmap("assets/images/logoflicker.png") @:keep #if display private #end class __ASSET__assets_images_logoflicker_png extends flash.display.BitmapData {}
@:file("assets/images/menu/button originals/buttontemplate - Copy.pdn") @:keep #if display private #end class __ASSET__assets_images_menu_button_originals_buttontemplate___copy_pdn extends flash.utils.ByteArray {}
@:file("assets/images/menu/button originals/button_begin.pdn") @:keep #if display private #end class __ASSET__assets_images_menu_button_originals_button_begin_pdn extends flash.utils.ByteArray {}
@:file("assets/images/menu/button originals/button_mute.pdn") @:keep #if display private #end class __ASSET__assets_images_menu_button_originals_button_mute_pdn extends flash.utils.ByteArray {}
@:file("assets/images/menu/button originals/button_pad.pdn") @:keep #if display private #end class __ASSET__assets_images_menu_button_originals_button_pad_pdn extends flash.utils.ByteArray {}
@:file("assets/images/menu/button originals/button_quit.pdn") @:keep #if display private #end class __ASSET__assets_images_menu_button_originals_button_quit_pdn extends flash.utils.ByteArray {}
@:file("assets/images/menu/button originals/button_settings.pdn") @:keep #if display private #end class __ASSET__assets_images_menu_button_originals_button_settings_pdn extends flash.utils.ByteArray {}
@:file("assets/images/menu/button originals/d_warning.pdn") @:keep #if display private #end class __ASSET__assets_images_menu_button_originals_d_warning_pdn extends flash.utils.ByteArray {}
@:file("assets/images/menu/buttontemplate.pdn") @:keep #if display private #end class __ASSET__assets_images_menu_buttontemplate_pdn extends flash.utils.ByteArray {}
@:bitmap("assets/images/menu/button_about.png") @:keep #if display private #end class __ASSET__assets_images_menu_button_about_png extends flash.display.BitmapData {}
@:bitmap("assets/images/menu/button_back.png") @:keep #if display private #end class __ASSET__assets_images_menu_button_back_png extends flash.display.BitmapData {}
@:bitmap("assets/images/menu/button_begin.png") @:keep #if display private #end class __ASSET__assets_images_menu_button_begin_png extends flash.display.BitmapData {}
@:bitmap("assets/images/menu/button_debug.png") @:keep #if display private #end class __ASSET__assets_images_menu_button_debug_png extends flash.display.BitmapData {}
@:bitmap("assets/images/menu/button_f.png") @:keep #if display private #end class __ASSET__assets_images_menu_button_f_png extends flash.display.BitmapData {}
@:bitmap("assets/images/menu/button_facts.png") @:keep #if display private #end class __ASSET__assets_images_menu_button_facts_png extends flash.display.BitmapData {}
@:bitmap("assets/images/menu/button_full.png") @:keep #if display private #end class __ASSET__assets_images_menu_button_full_png extends flash.display.BitmapData {}
@:bitmap("assets/images/menu/button_pad.png") @:keep #if display private #end class __ASSET__assets_images_menu_button_pad_png extends flash.display.BitmapData {}
@:bitmap("assets/images/menu/button_pluto.png") @:keep #if display private #end class __ASSET__assets_images_menu_button_pluto_png extends flash.display.BitmapData {}
@:bitmap("assets/images/menu/button_quit.png") @:keep #if display private #end class __ASSET__assets_images_menu_button_quit_png extends flash.display.BitmapData {}
@:bitmap("assets/images/menu/button_rand.png") @:keep #if display private #end class __ASSET__assets_images_menu_button_rand_png extends flash.display.BitmapData {}
@:bitmap("assets/images/menu/button_setting.png") @:keep #if display private #end class __ASSET__assets_images_menu_button_setting_png extends flash.display.BitmapData {}
@:bitmap("assets/images/menu/button_settings.png") @:keep #if display private #end class __ASSET__assets_images_menu_button_settings_png extends flash.display.BitmapData {}
@:bitmap("assets/images/menu/coordsblock.png") @:keep #if display private #end class __ASSET__assets_images_menu_coordsblock_png extends flash.display.BitmapData {}
@:bitmap("assets/images/menu/d_warning.png") @:keep #if display private #end class __ASSET__assets_images_menu_d_warning_png extends flash.display.BitmapData {}
@:bitmap("assets/images/menu/d_warn_cancel.png") @:keep #if display private #end class __ASSET__assets_images_menu_d_warn_cancel_png extends flash.display.BitmapData {}
@:file("assets/images/menu/d_warn_ok.pdn") @:keep #if display private #end class __ASSET__assets_images_menu_d_warn_ok_pdn extends flash.utils.ByteArray {}
@:bitmap("assets/images/menu/d_warn_ok.png") @:keep #if display private #end class __ASSET__assets_images_menu_d_warn_ok_png extends flash.display.BitmapData {}
@:bitmap("assets/images/menu/full_exit_notice.png") @:keep #if display private #end class __ASSET__assets_images_menu_full_exit_notice_png extends flash.display.BitmapData {}
@:bitmap("assets/images/menu/moons/CharonOrbit.png") @:keep #if display private #end class __ASSET__assets_images_menu_moons_charonorbit_png extends flash.display.BitmapData {}
@:bitmap("assets/images/menu/moons/HydraOrbit.png") @:keep #if display private #end class __ASSET__assets_images_menu_moons_hydraorbit_png extends flash.display.BitmapData {}
@:bitmap("assets/images/menu/moons/KerberosOrbit.png") @:keep #if display private #end class __ASSET__assets_images_menu_moons_kerberosorbit_png extends flash.display.BitmapData {}
@:bitmap("assets/images/menu/moons/NixOrbit.png") @:keep #if display private #end class __ASSET__assets_images_menu_moons_nixorbit_png extends flash.display.BitmapData {}
@:bitmap("assets/images/menu/moons/original/Charon.png") @:keep #if display private #end class __ASSET__assets_images_menu_moons_original_charon_png extends flash.display.BitmapData {}
@:bitmap("assets/images/menu/moons/original/Hydra.png") @:keep #if display private #end class __ASSET__assets_images_menu_moons_original_hydra_png extends flash.display.BitmapData {}
@:bitmap("assets/images/menu/moons/original/Kerberos.png") @:keep #if display private #end class __ASSET__assets_images_menu_moons_original_kerberos_png extends flash.display.BitmapData {}
@:bitmap("assets/images/menu/moons/original/Nix.png") @:keep #if display private #end class __ASSET__assets_images_menu_moons_original_nix_png extends flash.display.BitmapData {}
@:bitmap("assets/images/menu/moons/original/Styx.png") @:keep #if display private #end class __ASSET__assets_images_menu_moons_original_styx_png extends flash.display.BitmapData {}
@:bitmap("assets/images/menu/moons/Pluto.png") @:keep #if display private #end class __ASSET__assets_images_menu_moons_pluto_png extends flash.display.BitmapData {}
@:bitmap("assets/images/menu/moons/StyxOrbit.png") @:keep #if display private #end class __ASSET__assets_images_menu_moons_styxorbit_png extends flash.display.BitmapData {}
@:bitmap("assets/images/menu/splash_x640.png") @:keep #if display private #end class __ASSET__assets_images_menu_splash_x640_png extends flash.display.BitmapData {}
@:bitmap("assets/images/menu/starback.png") @:keep #if display private #end class __ASSET__assets_images_menu_starback_png extends flash.display.BitmapData {}
@:file("assets/images/misc/320xp.pdn") @:keep #if display private #end class __ASSET__assets_images_misc_320xp_pdn extends flash.utils.ByteArray {}
@:bitmap("assets/images/misc/320xp.png") @:keep #if display private #end class __ASSET__assets_images_misc_320xp_png extends flash.display.BitmapData {}
@:bitmap("assets/images/misc/earth-32x.png") @:keep #if display private #end class __ASSET__assets_images_misc_earth_32x_png extends flash.display.BitmapData {}
@:bitmap("assets/images/misc/pls.png") @:keep #if display private #end class __ASSET__assets_images_misc_pls_png extends flash.display.BitmapData {}
@:bitmap("assets/images/mute/Mute.png") @:keep #if display private #end class __ASSET__assets_images_mute_mute_png extends flash.display.BitmapData {}
@:bitmap("assets/images/mute/MuteOn.png") @:keep #if display private #end class __ASSET__assets_images_mute_muteon_png extends flash.display.BitmapData {}
@:file("assets/images/NH.ico") @:keep #if display private #end class __ASSET__assets_images_nh_ico extends flash.utils.ByteArray {}
@:file("assets/images/nh_large.svg") @:keep #if display private #end class __ASSET__assets_images_nh_large_svg extends flash.utils.ByteArray {}
@:bitmap("assets/images/pepssiwire/background.png") @:keep #if display private #end class __ASSET__assets_images_pepssiwire_background_png extends flash.display.BitmapData {}
@:bitmap("assets/images/pepssiwire/bblue.png") @:keep #if display private #end class __ASSET__assets_images_pepssiwire_bblue_png extends flash.display.BitmapData {}
@:file("assets/images/pepssiwire/box - Copy.pdn") @:keep #if display private #end class __ASSET__assets_images_pepssiwire_box___copy_pdn extends flash.utils.ByteArray {}
@:file("assets/images/pepssiwire/box-mockup.pdn") @:keep #if display private #end class __ASSET__assets_images_pepssiwire_box_mockup_pdn extends flash.utils.ByteArray {}
@:bitmap("assets/images/pepssiwire/box-mockup.png") @:keep #if display private #end class __ASSET__assets_images_pepssiwire_box_mockup_png extends flash.display.BitmapData {}
@:file("assets/images/pepssiwire/box.pdn") @:keep #if display private #end class __ASSET__assets_images_pepssiwire_box_pdn extends flash.utils.ByteArray {}
@:bitmap("assets/images/pepssiwire/box.png") @:keep #if display private #end class __ASSET__assets_images_pepssiwire_box_png extends flash.display.BitmapData {}
@:bitmap("assets/images/pepssiwire/bparcel.png") @:keep #if display private #end class __ASSET__assets_images_pepssiwire_bparcel_png extends flash.display.BitmapData {}
@:bitmap("assets/images/pepssiwire/bpeach.png") @:keep #if display private #end class __ASSET__assets_images_pepssiwire_bpeach_png extends flash.display.BitmapData {}
@:bitmap("assets/images/pepssiwire/bpink.png") @:keep #if display private #end class __ASSET__assets_images_pepssiwire_bpink_png extends flash.display.BitmapData {}
@:bitmap("assets/images/pepssiwire/colors.png") @:keep #if display private #end class __ASSET__assets_images_pepssiwire_colors_png extends flash.display.BitmapData {}
@:bitmap("assets/images/pepssiwire/dialogback.png") @:keep #if display private #end class __ASSET__assets_images_pepssiwire_dialogback_png extends flash.display.BitmapData {}
@:bitmap("assets/images/pepssiwire/dialogtext.png") @:keep #if display private #end class __ASSET__assets_images_pepssiwire_dialogtext_png extends flash.display.BitmapData {}
@:bitmap("assets/images/pepssiwire/old/0bluealt.png") @:keep #if display private #end class __ASSET__assets_images_pepssiwire_old_0bluealt_png extends flash.display.BitmapData {}
@:bitmap("assets/images/pepssiwire/old/0limealt.png") @:keep #if display private #end class __ASSET__assets_images_pepssiwire_old_0limealt_png extends flash.display.BitmapData {}
@:bitmap("assets/images/pepssiwire/old/0peachalt.png") @:keep #if display private #end class __ASSET__assets_images_pepssiwire_old_0peachalt_png extends flash.display.BitmapData {}
@:bitmap("assets/images/pepssiwire/old/0pinkalt.png") @:keep #if display private #end class __ASSET__assets_images_pepssiwire_old_0pinkalt_png extends flash.display.BitmapData {}
@:bitmap("assets/images/pepssiwire/old/1bluealt.png") @:keep #if display private #end class __ASSET__assets_images_pepssiwire_old_1bluealt_png extends flash.display.BitmapData {}
@:bitmap("assets/images/pepssiwire/old/1limealt.png") @:keep #if display private #end class __ASSET__assets_images_pepssiwire_old_1limealt_png extends flash.display.BitmapData {}
@:bitmap("assets/images/pepssiwire/old/1peachalt.png") @:keep #if display private #end class __ASSET__assets_images_pepssiwire_old_1peachalt_png extends flash.display.BitmapData {}
@:bitmap("assets/images/pepssiwire/old/1pinkalt.png") @:keep #if display private #end class __ASSET__assets_images_pepssiwire_old_1pinkalt_png extends flash.display.BitmapData {}
@:bitmap("assets/images/pepssiwire/original/0blue.png") @:keep #if display private #end class __ASSET__assets_images_pepssiwire_original_0blue_png extends flash.display.BitmapData {}
@:bitmap("assets/images/pepssiwire/original/0lime.png") @:keep #if display private #end class __ASSET__assets_images_pepssiwire_original_0lime_png extends flash.display.BitmapData {}
@:bitmap("assets/images/pepssiwire/original/0peach.png") @:keep #if display private #end class __ASSET__assets_images_pepssiwire_original_0peach_png extends flash.display.BitmapData {}
@:bitmap("assets/images/pepssiwire/original/0pink.png") @:keep #if display private #end class __ASSET__assets_images_pepssiwire_original_0pink_png extends flash.display.BitmapData {}
@:file("assets/images/pepssiwire/parcel.pdn") @:keep #if display private #end class __ASSET__assets_images_pepssiwire_parcel_pdn extends flash.utils.ByteArray {}
@:bitmap("assets/images/pepssiwire/parcel.png") @:keep #if display private #end class __ASSET__assets_images_pepssiwire_parcel_png extends flash.display.BitmapData {}
@:file("assets/images/pepssiwire/sgsgsg.pdn") @:keep #if display private #end class __ASSET__assets_images_pepssiwire_sgsgsg_pdn extends flash.utils.ByteArray {}
@:file("assets/images/pepssiwire/Untitled.pdn") @:keep #if display private #end class __ASSET__assets_images_pepssiwire_untitled_pdn extends flash.utils.ByteArray {}
@:bitmap("assets/images/pepssiwire/Untitled.png") @:keep #if display private #end class __ASSET__assets_images_pepssiwire_untitled_png extends flash.display.BitmapData {}
@:file("assets/images/reference.txt") @:keep #if display private #end class __ASSET__assets_images_reference_txt extends flash.utils.ByteArray {}
@:file("assets/images/rtgrun/background.pdn") @:keep #if display private #end class __ASSET__assets_images_rtgrun_background_pdn extends flash.utils.ByteArray {}
@:bitmap("assets/images/rtgrun/background.png") @:keep #if display private #end class __ASSET__assets_images_rtgrun_background_png extends flash.display.BitmapData {}
@:bitmap("assets/images/rtgrun/clouds.png") @:keep #if display private #end class __ASSET__assets_images_rtgrun_clouds_png extends flash.display.BitmapData {}
@:file("assets/images/rtgrun/mockup.pdn") @:keep #if display private #end class __ASSET__assets_images_rtgrun_mockup_pdn extends flash.utils.ByteArray {}
@:file("assets/images/rtgrun/placeholder.pdn") @:keep #if display private #end class __ASSET__assets_images_rtgrun_placeholder_pdn extends flash.utils.ByteArray {}
@:bitmap("assets/images/rtgrun/placeholder.png") @:keep #if display private #end class __ASSET__assets_images_rtgrun_placeholder_png extends flash.display.BitmapData {}
@:bitmap("assets/images/rtgrun/sky.png") @:keep #if display private #end class __ASSET__assets_images_rtgrun_sky_png extends flash.display.BitmapData {}
@:bitmap("assets/images/settings/button_fullscreen.png") @:keep #if display private #end class __ASSET__assets_images_settings_button_fullscreen_png extends flash.display.BitmapData {}
@:bitmap("assets/images/settings/button_fullscreen_alt.png") @:keep #if display private #end class __ASSET__assets_images_settings_button_fullscreen_alt_png extends flash.display.BitmapData {}
@:bitmap("assets/images/settings/button_sound.png") @:keep #if display private #end class __ASSET__assets_images_settings_button_sound_png extends flash.display.BitmapData {}
@:bitmap("assets/images/settings/button_sound_alt.png") @:keep #if display private #end class __ASSET__assets_images_settings_button_sound_alt_png extends flash.display.BitmapData {}
@:file("assets/images/settings/originals/button_fullscreen.pdn") @:keep #if display private #end class __ASSET__assets_images_settings_originals_button_fullscreen_pdn extends flash.utils.ByteArray {}
@:file("assets/images/settings/originals/button_sound.pdn") @:keep #if display private #end class __ASSET__assets_images_settings_originals_button_sound_pdn extends flash.utils.ByteArray {}
@:bitmap("assets/images/settings/title_settings.png") @:keep #if display private #end class __ASSET__assets_images_settings_title_settings_png extends flash.display.BitmapData {}
@:sound("assets/music/menu-main2.wav") @:keep #if display private #end class __ASSET__assets_music_menu_main2_wav extends flash.media.Sound {}
@:file("assets/music/music_credits.txt") @:keep #if display private #end class __ASSET__assets_music_music_credits_txt extends flash.utils.ByteArray {}
@:sound("assets/sounds/data.wav") @:keep #if display private #end class __ASSET__assets_sounds_data_wav extends flash.media.Sound {}
@:sound("assets/sounds/error.wav") @:keep #if display private #end class __ASSET__assets_sounds_error_wav extends flash.media.Sound {}
@:sound("assets/sounds/get.wav") @:keep #if display private #end class __ASSET__assets_sounds_get_wav extends flash.media.Sound {}
@:sound("assets/sounds/introtone.mp3") @:keep #if display private #end class __ASSET__assets_sounds_introtone_mp3 extends flash.media.Sound {}
@:sound("assets/sounds/introtone.wav") @:keep #if display private #end class __ASSET__assets_sounds_introtone_wav extends flash.media.Sound {}
@:sound("assets/sounds/Pickup_Coin.wav") @:keep #if display private #end class __ASSET__assets_sounds_pickup_coin_wav extends flash.media.Sound {}
@:sound("assets/sounds/select.wav") @:keep #if display private #end class __ASSET__assets_sounds_select_wav extends flash.media.Sound {}
@:sound("assets/sounds/signal.wav") @:keep #if display private #end class __ASSET__assets_sounds_signal_wav extends flash.media.Sound {}
@:font("C:/HaxeToolkit/haxe/lib/flixel/3,3,12/assets/fonts/nokiafc22.ttf") @:keep #if display private #end class __ASSET__assets_fonts_nokiafc22_ttf extends flash.text.Font {}
@:font("C:/HaxeToolkit/haxe/lib/flixel/3,3,12/assets/fonts/arial.ttf") @:keep #if display private #end class __ASSET__assets_fonts_arial_ttf extends flash.text.Font {}





#else


class __ASSET__assets_fonts_oratorstd_otf extends openfl.text.Font { public function new () { super (); __fontPath = "assets/fonts/OratorStd.otf"; fontName = "Orator Std Medium";  }}
class __ASSET__assets_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { super (); __fontPath = "assets/fonts/nokiafc22.ttf"; fontName = "Nokia Cellphone FC Small";  }}
class __ASSET__assets_fonts_arial_ttf extends openfl.text.Font { public function new () { super (); __fontPath = "assets/fonts/arial.ttf"; fontName = "Arial";  }}


#end


#else


package;


import haxe.Timer;
import haxe.Unserializer;
import lime.app.Future;
import lime.app.Preloader;
import lime.app.Promise;
import lime.audio.AudioSource;
import lime.audio.openal.AL;
import lime.audio.AudioBuffer;
import lime.graphics.Image;
import lime.text.Font;
import lime.utils.ByteArray;
import lime.utils.UInt8Array;
import lime.Assets;

#if sys
import sys.FileSystem;
#end

#if (js && html5)
import lime.net.URLLoader;
import lime.net.URLRequest;
#elseif flash
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Loader;
import flash.events.Event;
import flash.events.IOErrorEvent;
import flash.events.ProgressEvent;
import flash.media.Sound;
import flash.net.URLLoader;
import flash.net.URLRequest;
#end


class DefaultAssetLibrary extends AssetLibrary {
	
	
	public var className (default, null) = new Map <String, Dynamic> ();
	public var path (default, null) = new Map <String, String> ();
	public var type (default, null) = new Map <String, AssetType> ();
	
	private var lastModified:Float;
	private var timer:Timer;
	
	
	public function new () {
		
		super ();
		
		#if (openfl && !flash)
		
		
		
		
		
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_fonts_oratorstd_otf);
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_fonts_nokiafc22_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_fonts_arial_ttf);
		
		#end
		
		#if flash
		
		className.set ("assets/data/alicemap.oep", __ASSET__assets_data_alicemap_oep);
		type.set ("assets/data/alicemap.oep", AssetType.TEXT);
		className.set ("assets/data/maze.oel", __ASSET__assets_data_maze_oel);
		type.set ("assets/data/maze.oel", AssetType.TEXT);
		className.set ("assets/data/plats.oel", __ASSET__assets_data_plats_oel);
		type.set ("assets/data/plats.oel", AssetType.TEXT);
		className.set ("assets/data/rtgmap.oep", __ASSET__assets_data_rtgmap_oep);
		type.set ("assets/data/rtgmap.oep", AssetType.TEXT);
		className.set ("assets/fonts/OratorStd.otf", __ASSET__assets_fonts_oratorstd_otf);
		type.set ("assets/fonts/OratorStd.otf", AssetType.FONT);
		className.set ("assets/images/!originals/bt_orig/comp_alice_alt.png", __ASSET__assets_images__originals_bt_orig_comp_alice_alt_png);
		type.set ("assets/images/!originals/bt_orig/comp_alice_alt.png", AssetType.IMAGE);
		className.set ("assets/images/!originals/bt_orig/comp_alice_hover.png", __ASSET__assets_images__originals_bt_orig_comp_alice_hover_png);
		type.set ("assets/images/!originals/bt_orig/comp_alice_hover.png", AssetType.IMAGE);
		className.set ("assets/images/!originals/bt_orig/comp_lorri_alt.png", __ASSET__assets_images__originals_bt_orig_comp_lorri_alt_png);
		type.set ("assets/images/!originals/bt_orig/comp_lorri_alt.png", AssetType.IMAGE);
		className.set ("assets/images/!originals/bt_orig/comp_lorri_hover.png", __ASSET__assets_images__originals_bt_orig_comp_lorri_hover_png);
		type.set ("assets/images/!originals/bt_orig/comp_lorri_hover.png", AssetType.IMAGE);
		className.set ("assets/images/!originals/bt_orig/comp_pepssi_alt.png", __ASSET__assets_images__originals_bt_orig_comp_pepssi_alt_png);
		type.set ("assets/images/!originals/bt_orig/comp_pepssi_alt.png", AssetType.IMAGE);
		className.set ("assets/images/!originals/bt_orig/comp_pepssi_hover.png", __ASSET__assets_images__originals_bt_orig_comp_pepssi_hover_png);
		type.set ("assets/images/!originals/bt_orig/comp_pepssi_hover.png", AssetType.IMAGE);
		className.set ("assets/images/!originals/bt_orig/comp_ralph_alt.png", __ASSET__assets_images__originals_bt_orig_comp_ralph_alt_png);
		type.set ("assets/images/!originals/bt_orig/comp_ralph_alt.png", AssetType.IMAGE);
		className.set ("assets/images/!originals/bt_orig/comp_ralph_hover.png", __ASSET__assets_images__originals_bt_orig_comp_ralph_hover_png);
		type.set ("assets/images/!originals/bt_orig/comp_ralph_hover.png", AssetType.IMAGE);
		className.set ("assets/images/!originals/intro_originals/beach.pdn", __ASSET__assets_images__originals_intro_originals_beach_pdn);
		type.set ("assets/images/!originals/intro_originals/beach.pdn", AssetType.TEXT);
		className.set ("assets/images/!originals/intro_originals/Untitled.pdn", __ASSET__assets_images__originals_intro_originals_untitled_pdn);
		type.set ("assets/images/!originals/intro_originals/Untitled.pdn", AssetType.TEXT);
		className.set ("assets/images/!originals/intro_originals/vab.pdn", __ASSET__assets_images__originals_intro_originals_vab_pdn);
		type.set ("assets/images/!originals/intro_originals/vab.pdn", AssetType.TEXT);
		className.set ("assets/images/!originals/launchblock_other/nh-atlas-v.pdn", __ASSET__assets_images__originals_launchblock_other_nh_atlas_v_pdn);
		type.set ("assets/images/!originals/launchblock_other/nh-atlas-v.pdn", AssetType.TEXT);
		className.set ("assets/images/!originals/launchblock_other/nh-launch-block/Atlas_V_551_with_New_Horizons_on_Launch_Pad_41.jpg", __ASSET__assets_images__originals_launchblock_other_nh_launch_block_atlas_v_551_with_new_horizons_on_launch_pad_41_jpg);
		type.set ("assets/images/!originals/launchblock_other/nh-launch-block/Atlas_V_551_with_New_Horizons_on_Launch_Pad_41.jpg", AssetType.IMAGE);
		className.set ("assets/images/!originals/launchblock_other/nh-launch-block/nh-static-atlasv-launch.jpg", __ASSET__assets_images__originals_launchblock_other_nh_launch_block_nh_static_atlasv_launch_jpg);
		type.set ("assets/images/!originals/launchblock_other/nh-launch-block/nh-static-atlasv-launch.jpg", AssetType.IMAGE);
		className.set ("assets/images/!originals/launchblock_other/nh-launch-block.pdn", __ASSET__assets_images__originals_launchblock_other_nh_launch_block_pdn);
		type.set ("assets/images/!originals/launchblock_other/nh-launch-block.pdn", AssetType.TEXT);
		className.set ("assets/images/!originals/launchblock_other/nh-launch-block.png", __ASSET__assets_images__originals_launchblock_other_nh_launch_block_png);
		type.set ("assets/images/!originals/launchblock_other/nh-launch-block.png", AssetType.IMAGE);
		className.set ("assets/images/!originals/launchblock_other/nh-launch-long - Copy.pdn", __ASSET__assets_images__originals_launchblock_other_nh_launch_long___copy_pdn);
		type.set ("assets/images/!originals/launchblock_other/nh-launch-long - Copy.pdn", AssetType.TEXT);
		className.set ("assets/images/!originals/launchblock_other/nh-launch-long-old.pdn", __ASSET__assets_images__originals_launchblock_other_nh_launch_long_old_pdn);
		type.set ("assets/images/!originals/launchblock_other/nh-launch-long-old.pdn", AssetType.TEXT);
		className.set ("assets/images/!originals/launchblock_other/nh-launch-long.pdn", __ASSET__assets_images__originals_launchblock_other_nh_launch_long_pdn);
		type.set ("assets/images/!originals/launchblock_other/nh-launch-long.pdn", AssetType.TEXT);
		className.set ("assets/images/!originals/launchblock_other/nh-launch-long.png", __ASSET__assets_images__originals_launchblock_other_nh_launch_long_png);
		type.set ("assets/images/!originals/launchblock_other/nh-launch-long.png", AssetType.IMAGE);
		className.set ("assets/images/!originals/launchblock_other/nh-pastel.png", __ASSET__assets_images__originals_launchblock_other_nh_pastel_png);
		type.set ("assets/images/!originals/launchblock_other/nh-pastel.png", AssetType.IMAGE);
		className.set ("assets/images/!originals/launchblock_other/nh-postcard - Copy.pdn", __ASSET__assets_images__originals_launchblock_other_nh_postcard___copy_pdn);
		type.set ("assets/images/!originals/launchblock_other/nh-postcard - Copy.pdn", AssetType.TEXT);
		className.set ("assets/images/!originals/launchblock_other/nh-postcard - Copy.png", __ASSET__assets_images__originals_launchblock_other_nh_postcard___copy_png);
		type.set ("assets/images/!originals/launchblock_other/nh-postcard - Copy.png", AssetType.IMAGE);
		className.set ("assets/images/!originals/launchblock_other/nh-postcard.pdn", __ASSET__assets_images__originals_launchblock_other_nh_postcard_pdn);
		type.set ("assets/images/!originals/launchblock_other/nh-postcard.pdn", AssetType.TEXT);
		className.set ("assets/images/!originals/launchblock_other/nh-postcard.png", __ASSET__assets_images__originals_launchblock_other_nh_postcard_png);
		type.set ("assets/images/!originals/launchblock_other/nh-postcard.png", AssetType.IMAGE);
		className.set ("assets/images/!originals/launchblock_other/pad-norocket.pdn", __ASSET__assets_images__originals_launchblock_other_pad_norocket_pdn);
		type.set ("assets/images/!originals/launchblock_other/pad-norocket.pdn", AssetType.TEXT);
		className.set ("assets/images/!originals/launchblock_other/pad-rocket.pdn", __ASSET__assets_images__originals_launchblock_other_pad_rocket_pdn);
		type.set ("assets/images/!originals/launchblock_other/pad-rocket.pdn", AssetType.TEXT);
		className.set ("assets/images/!originals/splash/splash_x640.jpg", __ASSET__assets_images__originals_splash_splash_x640_jpg);
		type.set ("assets/images/!originals/splash/splash_x640.jpg", AssetType.IMAGE);
		className.set ("assets/images/!originals/splash/startup-splash-hero - Copy.png", __ASSET__assets_images__originals_splash_startup_splash_hero___copy_png);
		type.set ("assets/images/!originals/splash/startup-splash-hero - Copy.png", AssetType.IMAGE);
		className.set ("assets/images/!originals/splash/startup-splash-hero.png", __ASSET__assets_images__originals_splash_startup_splash_hero_png);
		type.set ("assets/images/!originals/splash/startup-splash-hero.png", AssetType.IMAGE);
		className.set ("assets/images/!originals/stemlogo.pdn", __ASSET__assets_images__originals_stemlogo_pdn);
		type.set ("assets/images/!originals/stemlogo.pdn", AssetType.TEXT);
		className.set ("assets/images/about/stemlogo.png", __ASSET__assets_images_about_stemlogo_png);
		type.set ("assets/images/about/stemlogo.png", AssetType.IMAGE);
		className.set ("assets/images/about/title_about.png", __ASSET__assets_images_about_title_about_png);
		type.set ("assets/images/about/title_about.png", AssetType.IMAGE);
		className.set ("assets/images/alicemaze/alice_hit.png", __ASSET__assets_images_alicemaze_alice_hit_png);
		type.set ("assets/images/alicemaze/alice_hit.png", AssetType.IMAGE);
		className.set ("assets/images/alicemaze/b-bottom.png", __ASSET__assets_images_alicemaze_b_bottom_png);
		type.set ("assets/images/alicemaze/b-bottom.png", AssetType.IMAGE);
		className.set ("assets/images/alicemaze/b-full.png", __ASSET__assets_images_alicemaze_b_full_png);
		type.set ("assets/images/alicemaze/b-full.png", AssetType.IMAGE);
		className.set ("assets/images/alicemaze/b-hori.png", __ASSET__assets_images_alicemaze_b_hori_png);
		type.set ("assets/images/alicemaze/b-hori.png", AssetType.IMAGE);
		className.set ("assets/images/alicemaze/b-island.png", __ASSET__assets_images_alicemaze_b_island_png);
		type.set ("assets/images/alicemaze/b-island.png", AssetType.IMAGE);
		className.set ("assets/images/alicemaze/b-lb.png", __ASSET__assets_images_alicemaze_b_lb_png);
		type.set ("assets/images/alicemaze/b-lb.png", AssetType.IMAGE);
		className.set ("assets/images/alicemaze/b-left.png", __ASSET__assets_images_alicemaze_b_left_png);
		type.set ("assets/images/alicemaze/b-left.png", AssetType.IMAGE);
		className.set ("assets/images/alicemaze/b-map.png", __ASSET__assets_images_alicemaze_b_map_png);
		type.set ("assets/images/alicemaze/b-map.png", AssetType.IMAGE);
		className.set ("assets/images/alicemaze/b-rb.png", __ASSET__assets_images_alicemaze_b_rb_png);
		type.set ("assets/images/alicemaze/b-rb.png", AssetType.IMAGE);
		className.set ("assets/images/alicemaze/b-right.png", __ASSET__assets_images_alicemaze_b_right_png);
		type.set ("assets/images/alicemaze/b-right.png", AssetType.IMAGE);
		className.set ("assets/images/alicemaze/b-top.png", __ASSET__assets_images_alicemaze_b_top_png);
		type.set ("assets/images/alicemaze/b-top.png", AssetType.IMAGE);
		className.set ("assets/images/alicemaze/b-ul.png", __ASSET__assets_images_alicemaze_b_ul_png);
		type.set ("assets/images/alicemaze/b-ul.png", AssetType.IMAGE);
		className.set ("assets/images/alicemaze/b-ur.png", __ASSET__assets_images_alicemaze_b_ur_png);
		type.set ("assets/images/alicemaze/b-ur.png", AssetType.IMAGE);
		className.set ("assets/images/alicemaze/b-vert.png", __ASSET__assets_images_alicemaze_b_vert_png);
		type.set ("assets/images/alicemaze/b-vert.png", AssetType.IMAGE);
		className.set ("assets/images/alicemaze/cleaner.png", __ASSET__assets_images_alicemaze_cleaner_png);
		type.set ("assets/images/alicemaze/cleaner.png", AssetType.IMAGE);
		className.set ("assets/images/alicemaze/dialogue/alice_dialogue_back.pdn", __ASSET__assets_images_alicemaze_dialogue_alice_dialogue_back_pdn);
		type.set ("assets/images/alicemaze/dialogue/alice_dialogue_back.pdn", AssetType.TEXT);
		className.set ("assets/images/alicemaze/dialogue/alice_dialogue_back.png", __ASSET__assets_images_alicemaze_dialogue_alice_dialogue_back_png);
		type.set ("assets/images/alicemaze/dialogue/alice_dialogue_back.png", AssetType.IMAGE);
		className.set ("assets/images/alicemaze/dialogue/OldManNormal.png", __ASSET__assets_images_alicemaze_dialogue_oldmannormal_png);
		type.set ("assets/images/alicemaze/dialogue/OldManNormal.png", AssetType.IMAGE);
		className.set ("assets/images/alicemaze/dialogue/speak0.png", __ASSET__assets_images_alicemaze_dialogue_speak0_png);
		type.set ("assets/images/alicemaze/dialogue/speak0.png", AssetType.IMAGE);
		className.set ("assets/images/alicemaze/dialogue/speak_0.png", __ASSET__assets_images_alicemaze_dialogue_speak_0_png);
		type.set ("assets/images/alicemaze/dialogue/speak_0.png", AssetType.IMAGE);
		className.set ("assets/images/alicemaze/dialogue/speak_template.png", __ASSET__assets_images_alicemaze_dialogue_speak_template_png);
		type.set ("assets/images/alicemaze/dialogue/speak_template.png", AssetType.IMAGE);
		className.set ("assets/images/alicemaze/dialogue/tag.png", __ASSET__assets_images_alicemaze_dialogue_tag_png);
		type.set ("assets/images/alicemaze/dialogue/tag.png", AssetType.IMAGE);
		className.set ("assets/images/alicemaze/dialogue/wasd/wasd_a.png", __ASSET__assets_images_alicemaze_dialogue_wasd_wasd_a_png);
		type.set ("assets/images/alicemaze/dialogue/wasd/wasd_a.png", AssetType.IMAGE);
		className.set ("assets/images/alicemaze/dialogue/wasd/wasd_d.png", __ASSET__assets_images_alicemaze_dialogue_wasd_wasd_d_png);
		type.set ("assets/images/alicemaze/dialogue/wasd/wasd_d.png", AssetType.IMAGE);
		className.set ("assets/images/alicemaze/dialogue/wasd/wasd_finger.pdn", __ASSET__assets_images_alicemaze_dialogue_wasd_wasd_finger_pdn);
		type.set ("assets/images/alicemaze/dialogue/wasd/wasd_finger.pdn", AssetType.TEXT);
		className.set ("assets/images/alicemaze/dialogue/wasd/wasd_s.pdn", __ASSET__assets_images_alicemaze_dialogue_wasd_wasd_s_pdn);
		type.set ("assets/images/alicemaze/dialogue/wasd/wasd_s.pdn", AssetType.TEXT);
		className.set ("assets/images/alicemaze/dialogue/wasd/wasd_s.png", __ASSET__assets_images_alicemaze_dialogue_wasd_wasd_s_png);
		type.set ("assets/images/alicemaze/dialogue/wasd/wasd_s.png", AssetType.IMAGE);
		className.set ("assets/images/alicemaze/dialogue/wasd/wasd_template.pdn", __ASSET__assets_images_alicemaze_dialogue_wasd_wasd_template_pdn);
		type.set ("assets/images/alicemaze/dialogue/wasd/wasd_template.pdn", AssetType.TEXT);
		className.set ("assets/images/alicemaze/dialogue/wasd/wasd_w.png", __ASSET__assets_images_alicemaze_dialogue_wasd_wasd_w_png);
		type.set ("assets/images/alicemaze/dialogue/wasd/wasd_w.png", AssetType.IMAGE);
		className.set ("assets/images/alicemaze/dialogue/wasd.png", __ASSET__assets_images_alicemaze_dialogue_wasd_png);
		type.set ("assets/images/alicemaze/dialogue/wasd.png", AssetType.IMAGE);
		className.set ("assets/images/alicemaze/player.png", __ASSET__assets_images_alicemaze_player_png);
		type.set ("assets/images/alicemaze/player.png", AssetType.IMAGE);
		className.set ("assets/images/component/buttonsprites/comp_alice_alt.png", __ASSET__assets_images_component_buttonsprites_comp_alice_alt_png);
		type.set ("assets/images/component/buttonsprites/comp_alice_alt.png", AssetType.IMAGE);
		className.set ("assets/images/component/buttonsprites/comp_alice_d.png", __ASSET__assets_images_component_buttonsprites_comp_alice_d_png);
		type.set ("assets/images/component/buttonsprites/comp_alice_d.png", AssetType.IMAGE);
		className.set ("assets/images/component/buttonsprites/comp_heat_alt.png", __ASSET__assets_images_component_buttonsprites_comp_heat_alt_png);
		type.set ("assets/images/component/buttonsprites/comp_heat_alt.png", AssetType.IMAGE);
		className.set ("assets/images/component/buttonsprites/comp_heat_d.png", __ASSET__assets_images_component_buttonsprites_comp_heat_d_png);
		type.set ("assets/images/component/buttonsprites/comp_heat_d.png", AssetType.IMAGE);
		className.set ("assets/images/component/buttonsprites/comp_lorri_alt.png", __ASSET__assets_images_component_buttonsprites_comp_lorri_alt_png);
		type.set ("assets/images/component/buttonsprites/comp_lorri_alt.png", AssetType.IMAGE);
		className.set ("assets/images/component/buttonsprites/comp_lorri_d.png", __ASSET__assets_images_component_buttonsprites_comp_lorri_d_png);
		type.set ("assets/images/component/buttonsprites/comp_lorri_d.png", AssetType.IMAGE);
		className.set ("assets/images/component/buttonsprites/comp_pepssi_alt.png", __ASSET__assets_images_component_buttonsprites_comp_pepssi_alt_png);
		type.set ("assets/images/component/buttonsprites/comp_pepssi_alt.png", AssetType.IMAGE);
		className.set ("assets/images/component/buttonsprites/comp_pepssi_d.png", __ASSET__assets_images_component_buttonsprites_comp_pepssi_d_png);
		type.set ("assets/images/component/buttonsprites/comp_pepssi_d.png", AssetType.IMAGE);
		className.set ("assets/images/component/buttonsprites/comp_ralph_alt.png", __ASSET__assets_images_component_buttonsprites_comp_ralph_alt_png);
		type.set ("assets/images/component/buttonsprites/comp_ralph_alt.png", AssetType.IMAGE);
		className.set ("assets/images/component/buttonsprites/comp_ralph_d.png", __ASSET__assets_images_component_buttonsprites_comp_ralph_d_png);
		type.set ("assets/images/component/buttonsprites/comp_ralph_d.png", AssetType.IMAGE);
		className.set ("assets/images/component/buttonsprites/comp_rex_alt.png", __ASSET__assets_images_component_buttonsprites_comp_rex_alt_png);
		type.set ("assets/images/component/buttonsprites/comp_rex_alt.png", AssetType.IMAGE);
		className.set ("assets/images/component/buttonsprites/comp_rex_d.png", __ASSET__assets_images_component_buttonsprites_comp_rex_d_png);
		type.set ("assets/images/component/buttonsprites/comp_rex_d.png", AssetType.IMAGE);
		className.set ("assets/images/component/buttonsprites/comp_rtg_alt.png", __ASSET__assets_images_component_buttonsprites_comp_rtg_alt_png);
		type.set ("assets/images/component/buttonsprites/comp_rtg_alt.png", AssetType.IMAGE);
		className.set ("assets/images/component/buttonsprites/comp_rtg_d.png", __ASSET__assets_images_component_buttonsprites_comp_rtg_d_png);
		type.set ("assets/images/component/buttonsprites/comp_rtg_d.png", AssetType.IMAGE);
		className.set ("assets/images/component/buttonsprites/comp_swap_alt.png", __ASSET__assets_images_component_buttonsprites_comp_swap_alt_png);
		type.set ("assets/images/component/buttonsprites/comp_swap_alt.png", AssetType.IMAGE);
		className.set ("assets/images/component/buttonsprites/comp_swap_d.png", __ASSET__assets_images_component_buttonsprites_comp_swap_d_png);
		type.set ("assets/images/component/buttonsprites/comp_swap_d.png", AssetType.IMAGE);
		className.set ("assets/images/component/buttonsprites/template.pdn", __ASSET__assets_images_component_buttonsprites_template_pdn);
		type.set ("assets/images/component/buttonsprites/template.pdn", AssetType.TEXT);
		className.set ("assets/images/component/comp_alice.png", __ASSET__assets_images_component_comp_alice_png);
		type.set ("assets/images/component/comp_alice.png", AssetType.IMAGE);
		className.set ("assets/images/component/comp_heatshield.png", __ASSET__assets_images_component_comp_heatshield_png);
		type.set ("assets/images/component/comp_heatshield.png", AssetType.IMAGE);
		className.set ("assets/images/component/comp_lorri.png", __ASSET__assets_images_component_comp_lorri_png);
		type.set ("assets/images/component/comp_lorri.png", AssetType.IMAGE);
		className.set ("assets/images/component/comp_pepssi.png", __ASSET__assets_images_component_comp_pepssi_png);
		type.set ("assets/images/component/comp_pepssi.png", AssetType.IMAGE);
		className.set ("assets/images/component/comp_ralph.png", __ASSET__assets_images_component_comp_ralph_png);
		type.set ("assets/images/component/comp_ralph.png", AssetType.IMAGE);
		className.set ("assets/images/component/comp_rex.png", __ASSET__assets_images_component_comp_rex_png);
		type.set ("assets/images/component/comp_rex.png", AssetType.IMAGE);
		className.set ("assets/images/component/comp_rtg.png", __ASSET__assets_images_component_comp_rtg_png);
		type.set ("assets/images/component/comp_rtg.png", AssetType.IMAGE);
		className.set ("assets/images/component/comp_swap.png", __ASSET__assets_images_component_comp_swap_png);
		type.set ("assets/images/component/comp_swap.png", AssetType.IMAGE);
		className.set ("assets/images/component/NH.png", __ASSET__assets_images_component_nh_png);
		type.set ("assets/images/component/NH.png", AssetType.IMAGE);
		className.set ("assets/images/component/nh_large.png", __ASSET__assets_images_component_nh_large_png);
		type.set ("assets/images/component/nh_large.png", AssetType.IMAGE);
		className.set ("assets/images/facts/fact0.png", __ASSET__assets_images_facts_fact0_png);
		type.set ("assets/images/facts/fact0.png", AssetType.IMAGE);
		className.set ("assets/images/facts/fact1.png", __ASSET__assets_images_facts_fact1_png);
		type.set ("assets/images/facts/fact1.png", AssetType.IMAGE);
		className.set ("assets/images/facts/fact2.png", __ASSET__assets_images_facts_fact2_png);
		type.set ("assets/images/facts/fact2.png", AssetType.IMAGE);
		className.set ("assets/images/facts/fact3.png", __ASSET__assets_images_facts_fact3_png);
		type.set ("assets/images/facts/fact3.png", AssetType.IMAGE);
		className.set ("assets/images/found/alice_button_backdrop.png", __ASSET__assets_images_found_alice_button_backdrop_png);
		type.set ("assets/images/found/alice_button_backdrop.png", AssetType.IMAGE);
		className.set ("assets/images/found/found_alice.png", __ASSET__assets_images_found_found_alice_png);
		type.set ("assets/images/found/found_alice.png", AssetType.IMAGE);
		className.set ("assets/images/found/found_alice_button.png", __ASSET__assets_images_found_found_alice_button_png);
		type.set ("assets/images/found/found_alice_button.png", AssetType.IMAGE);
		className.set ("assets/images/found/found_originals/alicefound.pdn", __ASSET__assets_images_found_found_originals_alicefound_pdn);
		type.set ("assets/images/found/found_originals/alicefound.pdn", AssetType.TEXT);
		className.set ("assets/images/found/found_originals/found-template.pdn", __ASSET__assets_images_found_found_originals_found_template_pdn);
		type.set ("assets/images/found/found_originals/found-template.pdn", AssetType.TEXT);
		className.set ("assets/images/found/found_originals/found_alice_button.pdn", __ASSET__assets_images_found_found_originals_found_alice_button_pdn);
		type.set ("assets/images/found/found_originals/found_alice_button.pdn", AssetType.TEXT);
		className.set ("assets/images/found/found_originals/rtg_found.pdn", __ASSET__assets_images_found_found_originals_rtg_found_pdn);
		type.set ("assets/images/found/found_originals/rtg_found.pdn", AssetType.TEXT);
		className.set ("assets/images/found/found_pepssi.png", __ASSET__assets_images_found_found_pepssi_png);
		type.set ("assets/images/found/found_pepssi.png", AssetType.IMAGE);
		className.set ("assets/images/found/found_pepssi_button.png", __ASSET__assets_images_found_found_pepssi_button_png);
		type.set ("assets/images/found/found_pepssi_button.png", AssetType.IMAGE);
		className.set ("assets/images/hub/alice_info.png", __ASSET__assets_images_hub_alice_info_png);
		type.set ("assets/images/hub/alice_info.png", AssetType.IMAGE);
		className.set ("assets/images/hub/blockout.png", __ASSET__assets_images_hub_blockout_png);
		type.set ("assets/images/hub/blockout.png", AssetType.IMAGE);
		className.set ("assets/images/hub/components_hero.png", __ASSET__assets_images_hub_components_hero_png);
		type.set ("assets/images/hub/components_hero.png", AssetType.IMAGE);
		className.set ("assets/images/hub/heat_info.png", __ASSET__assets_images_hub_heat_info_png);
		type.set ("assets/images/hub/heat_info.png", AssetType.IMAGE);
		className.set ("assets/images/hub/lorri_info.png", __ASSET__assets_images_hub_lorri_info_png);
		type.set ("assets/images/hub/lorri_info.png", AssetType.IMAGE);
		className.set ("assets/images/hub/pepssi_info.png", __ASSET__assets_images_hub_pepssi_info_png);
		type.set ("assets/images/hub/pepssi_info.png", AssetType.IMAGE);
		className.set ("assets/images/hub/ralph_info.png", __ASSET__assets_images_hub_ralph_info_png);
		type.set ("assets/images/hub/ralph_info.png", AssetType.IMAGE);
		className.set ("assets/images/hub/rex_info.png", __ASSET__assets_images_hub_rex_info_png);
		type.set ("assets/images/hub/rex_info.png", AssetType.IMAGE);
		className.set ("assets/images/hub/rtg_info.png", __ASSET__assets_images_hub_rtg_info_png);
		type.set ("assets/images/hub/rtg_info.png", AssetType.IMAGE);
		className.set ("assets/images/hub/swap_info.png", __ASSET__assets_images_hub_swap_info_png);
		type.set ("assets/images/hub/swap_info.png", AssetType.IMAGE);
		className.set ("assets/images/intro/beach.png", __ASSET__assets_images_intro_beach_png);
		type.set ("assets/images/intro/beach.png", AssetType.IMAGE);
		className.set ("assets/images/intro/name.png", __ASSET__assets_images_intro_name_png);
		type.set ("assets/images/intro/name.png", AssetType.IMAGE);
		className.set ("assets/images/intro/plane.png", __ASSET__assets_images_intro_plane_png);
		type.set ("assets/images/intro/plane.png", AssetType.IMAGE);
		className.set ("assets/images/intro/text0.png", __ASSET__assets_images_intro_text0_png);
		type.set ("assets/images/intro/text0.png", AssetType.IMAGE);
		className.set ("assets/images/intro/text1.png", __ASSET__assets_images_intro_text1_png);
		type.set ("assets/images/intro/text1.png", AssetType.IMAGE);
		className.set ("assets/images/intro/text2.png", __ASSET__assets_images_intro_text2_png);
		type.set ("assets/images/intro/text2.png", AssetType.IMAGE);
		className.set ("assets/images/intro/text3.png", __ASSET__assets_images_intro_text3_png);
		type.set ("assets/images/intro/text3.png", AssetType.IMAGE);
		className.set ("assets/images/intro/tower.png", __ASSET__assets_images_intro_tower_png);
		type.set ("assets/images/intro/tower.png", AssetType.IMAGE);
		className.set ("assets/images/intro/tutorial.png", __ASSET__assets_images_intro_tutorial_png);
		type.set ("assets/images/intro/tutorial.png", AssetType.IMAGE);
		className.set ("assets/images/intro/vab.png", __ASSET__assets_images_intro_vab_png);
		type.set ("assets/images/intro/vab.png", AssetType.IMAGE);
		className.set ("assets/images/launchblock/cloud0.png", __ASSET__assets_images_launchblock_cloud0_png);
		type.set ("assets/images/launchblock/cloud0.png", AssetType.IMAGE);
		className.set ("assets/images/launchblock/cloud1.png", __ASSET__assets_images_launchblock_cloud1_png);
		type.set ("assets/images/launchblock/cloud1.png", AssetType.IMAGE);
		className.set ("assets/images/launchblock/launch-thin-window.png", __ASSET__assets_images_launchblock_launch_thin_window_png);
		type.set ("assets/images/launchblock/launch-thin-window.png", AssetType.IMAGE);
		className.set ("assets/images/launchblock/launch-thin-window.png.meta", __ASSET__assets_images_launchblock_launch_thin_window_png_meta);
		type.set ("assets/images/launchblock/launch-thin-window.png.meta", AssetType.TEXT);
		className.set ("assets/images/launchblock/nh-atlas-v.pdn.meta", __ASSET__assets_images_launchblock_nh_atlas_v_pdn_meta);
		type.set ("assets/images/launchblock/nh-atlas-v.pdn.meta", AssetType.TEXT);
		className.set ("assets/images/launchblock/nh-launch-block.pdn.meta", __ASSET__assets_images_launchblock_nh_launch_block_pdn_meta);
		type.set ("assets/images/launchblock/nh-launch-block.pdn.meta", AssetType.TEXT);
		className.set ("assets/images/launchblock/nh-launch-block.png.meta", __ASSET__assets_images_launchblock_nh_launch_block_png_meta);
		type.set ("assets/images/launchblock/nh-launch-block.png.meta", AssetType.TEXT);
		className.set ("assets/images/launchblock/nh-launch-long - Copy.pdn.meta", __ASSET__assets_images_launchblock_nh_launch_long___copy_pdn_meta);
		type.set ("assets/images/launchblock/nh-launch-long - Copy.pdn.meta", AssetType.TEXT);
		className.set ("assets/images/launchblock/nh-launch-long-old.pdn.meta", __ASSET__assets_images_launchblock_nh_launch_long_old_pdn_meta);
		type.set ("assets/images/launchblock/nh-launch-long-old.pdn.meta", AssetType.TEXT);
		className.set ("assets/images/launchblock/nh-launch-long.pdn.meta", __ASSET__assets_images_launchblock_nh_launch_long_pdn_meta);
		type.set ("assets/images/launchblock/nh-launch-long.pdn.meta", AssetType.TEXT);
		className.set ("assets/images/launchblock/nh-launch-long.png.meta", __ASSET__assets_images_launchblock_nh_launch_long_png_meta);
		type.set ("assets/images/launchblock/nh-launch-long.png.meta", AssetType.TEXT);
		className.set ("assets/images/launchblock/nh-pastel.png.meta", __ASSET__assets_images_launchblock_nh_pastel_png_meta);
		type.set ("assets/images/launchblock/nh-pastel.png.meta", AssetType.TEXT);
		className.set ("assets/images/launchblock/nh-postcard - Copy - Copy.png.meta", __ASSET__assets_images_launchblock_nh_postcard___copy___copy_png_meta);
		type.set ("assets/images/launchblock/nh-postcard - Copy - Copy.png.meta", AssetType.TEXT);
		className.set ("assets/images/launchblock/nh-postcard - Copy.pdn.meta", __ASSET__assets_images_launchblock_nh_postcard___copy_pdn_meta);
		type.set ("assets/images/launchblock/nh-postcard - Copy.pdn.meta", AssetType.TEXT);
		className.set ("assets/images/launchblock/nh-postcard - Copy.png.meta", __ASSET__assets_images_launchblock_nh_postcard___copy_png_meta);
		type.set ("assets/images/launchblock/nh-postcard - Copy.png.meta", AssetType.TEXT);
		className.set ("assets/images/launchblock/nh-postcard-skeu.png.meta", __ASSET__assets_images_launchblock_nh_postcard_skeu_png_meta);
		type.set ("assets/images/launchblock/nh-postcard-skeu.png.meta", AssetType.TEXT);
		className.set ("assets/images/launchblock/nh-postcard.pdn.meta", __ASSET__assets_images_launchblock_nh_postcard_pdn_meta);
		type.set ("assets/images/launchblock/nh-postcard.pdn.meta", AssetType.TEXT);
		className.set ("assets/images/launchblock/nh-postcard.png.meta", __ASSET__assets_images_launchblock_nh_postcard_png_meta);
		type.set ("assets/images/launchblock/nh-postcard.png.meta", AssetType.TEXT);
		className.set ("assets/images/launchblock/pad-norocket.png", __ASSET__assets_images_launchblock_pad_norocket_png);
		type.set ("assets/images/launchblock/pad-norocket.png", AssetType.IMAGE);
		className.set ("assets/images/launchblock/pad-rocket.png", __ASSET__assets_images_launchblock_pad_rocket_png);
		type.set ("assets/images/launchblock/pad-rocket.png", AssetType.IMAGE);
		className.set ("assets/images/launchblock/skyback - Copy.png", __ASSET__assets_images_launchblock_skyback___copy_png);
		type.set ("assets/images/launchblock/skyback - Copy.png", AssetType.IMAGE);
		className.set ("assets/images/launchblock/skyback.png", __ASSET__assets_images_launchblock_skyback_png);
		type.set ("assets/images/launchblock/skyback.png", AssetType.IMAGE);
		className.set ("assets/images/logo.png", __ASSET__assets_images_logo_png);
		type.set ("assets/images/logo.png", AssetType.IMAGE);
		className.set ("assets/images/logoflicker.png", __ASSET__assets_images_logoflicker_png);
		type.set ("assets/images/logoflicker.png", AssetType.IMAGE);
		className.set ("assets/images/menu/button originals/buttontemplate - Copy.pdn", __ASSET__assets_images_menu_button_originals_buttontemplate___copy_pdn);
		type.set ("assets/images/menu/button originals/buttontemplate - Copy.pdn", AssetType.TEXT);
		className.set ("assets/images/menu/button originals/button_begin.pdn", __ASSET__assets_images_menu_button_originals_button_begin_pdn);
		type.set ("assets/images/menu/button originals/button_begin.pdn", AssetType.TEXT);
		className.set ("assets/images/menu/button originals/button_mute.pdn", __ASSET__assets_images_menu_button_originals_button_mute_pdn);
		type.set ("assets/images/menu/button originals/button_mute.pdn", AssetType.TEXT);
		className.set ("assets/images/menu/button originals/button_pad.pdn", __ASSET__assets_images_menu_button_originals_button_pad_pdn);
		type.set ("assets/images/menu/button originals/button_pad.pdn", AssetType.TEXT);
		className.set ("assets/images/menu/button originals/button_quit.pdn", __ASSET__assets_images_menu_button_originals_button_quit_pdn);
		type.set ("assets/images/menu/button originals/button_quit.pdn", AssetType.TEXT);
		className.set ("assets/images/menu/button originals/button_settings.pdn", __ASSET__assets_images_menu_button_originals_button_settings_pdn);
		type.set ("assets/images/menu/button originals/button_settings.pdn", AssetType.TEXT);
		className.set ("assets/images/menu/button originals/d_warning.pdn", __ASSET__assets_images_menu_button_originals_d_warning_pdn);
		type.set ("assets/images/menu/button originals/d_warning.pdn", AssetType.TEXT);
		className.set ("assets/images/menu/buttontemplate.pdn", __ASSET__assets_images_menu_buttontemplate_pdn);
		type.set ("assets/images/menu/buttontemplate.pdn", AssetType.TEXT);
		className.set ("assets/images/menu/button_about.png", __ASSET__assets_images_menu_button_about_png);
		type.set ("assets/images/menu/button_about.png", AssetType.IMAGE);
		className.set ("assets/images/menu/button_back.png", __ASSET__assets_images_menu_button_back_png);
		type.set ("assets/images/menu/button_back.png", AssetType.IMAGE);
		className.set ("assets/images/menu/button_begin.png", __ASSET__assets_images_menu_button_begin_png);
		type.set ("assets/images/menu/button_begin.png", AssetType.IMAGE);
		className.set ("assets/images/menu/button_debug.png", __ASSET__assets_images_menu_button_debug_png);
		type.set ("assets/images/menu/button_debug.png", AssetType.IMAGE);
		className.set ("assets/images/menu/button_f.png", __ASSET__assets_images_menu_button_f_png);
		type.set ("assets/images/menu/button_f.png", AssetType.IMAGE);
		className.set ("assets/images/menu/button_facts.png", __ASSET__assets_images_menu_button_facts_png);
		type.set ("assets/images/menu/button_facts.png", AssetType.IMAGE);
		className.set ("assets/images/menu/button_full.png", __ASSET__assets_images_menu_button_full_png);
		type.set ("assets/images/menu/button_full.png", AssetType.IMAGE);
		className.set ("assets/images/menu/button_pad.png", __ASSET__assets_images_menu_button_pad_png);
		type.set ("assets/images/menu/button_pad.png", AssetType.IMAGE);
		className.set ("assets/images/menu/button_pluto.png", __ASSET__assets_images_menu_button_pluto_png);
		type.set ("assets/images/menu/button_pluto.png", AssetType.IMAGE);
		className.set ("assets/images/menu/button_quit.png", __ASSET__assets_images_menu_button_quit_png);
		type.set ("assets/images/menu/button_quit.png", AssetType.IMAGE);
		className.set ("assets/images/menu/button_rand.png", __ASSET__assets_images_menu_button_rand_png);
		type.set ("assets/images/menu/button_rand.png", AssetType.IMAGE);
		className.set ("assets/images/menu/button_setting.png", __ASSET__assets_images_menu_button_setting_png);
		type.set ("assets/images/menu/button_setting.png", AssetType.IMAGE);
		className.set ("assets/images/menu/button_settings.png", __ASSET__assets_images_menu_button_settings_png);
		type.set ("assets/images/menu/button_settings.png", AssetType.IMAGE);
		className.set ("assets/images/menu/coordsblock.png", __ASSET__assets_images_menu_coordsblock_png);
		type.set ("assets/images/menu/coordsblock.png", AssetType.IMAGE);
		className.set ("assets/images/menu/d_warning.png", __ASSET__assets_images_menu_d_warning_png);
		type.set ("assets/images/menu/d_warning.png", AssetType.IMAGE);
		className.set ("assets/images/menu/d_warn_cancel.png", __ASSET__assets_images_menu_d_warn_cancel_png);
		type.set ("assets/images/menu/d_warn_cancel.png", AssetType.IMAGE);
		className.set ("assets/images/menu/d_warn_ok.pdn", __ASSET__assets_images_menu_d_warn_ok_pdn);
		type.set ("assets/images/menu/d_warn_ok.pdn", AssetType.TEXT);
		className.set ("assets/images/menu/d_warn_ok.png", __ASSET__assets_images_menu_d_warn_ok_png);
		type.set ("assets/images/menu/d_warn_ok.png", AssetType.IMAGE);
		className.set ("assets/images/menu/full_exit_notice.png", __ASSET__assets_images_menu_full_exit_notice_png);
		type.set ("assets/images/menu/full_exit_notice.png", AssetType.IMAGE);
		className.set ("assets/images/menu/moons/CharonOrbit.png", __ASSET__assets_images_menu_moons_charonorbit_png);
		type.set ("assets/images/menu/moons/CharonOrbit.png", AssetType.IMAGE);
		className.set ("assets/images/menu/moons/HydraOrbit.png", __ASSET__assets_images_menu_moons_hydraorbit_png);
		type.set ("assets/images/menu/moons/HydraOrbit.png", AssetType.IMAGE);
		className.set ("assets/images/menu/moons/KerberosOrbit.png", __ASSET__assets_images_menu_moons_kerberosorbit_png);
		type.set ("assets/images/menu/moons/KerberosOrbit.png", AssetType.IMAGE);
		className.set ("assets/images/menu/moons/NixOrbit.png", __ASSET__assets_images_menu_moons_nixorbit_png);
		type.set ("assets/images/menu/moons/NixOrbit.png", AssetType.IMAGE);
		className.set ("assets/images/menu/moons/original/Charon.png", __ASSET__assets_images_menu_moons_original_charon_png);
		type.set ("assets/images/menu/moons/original/Charon.png", AssetType.IMAGE);
		className.set ("assets/images/menu/moons/original/Hydra.png", __ASSET__assets_images_menu_moons_original_hydra_png);
		type.set ("assets/images/menu/moons/original/Hydra.png", AssetType.IMAGE);
		className.set ("assets/images/menu/moons/original/Kerberos.png", __ASSET__assets_images_menu_moons_original_kerberos_png);
		type.set ("assets/images/menu/moons/original/Kerberos.png", AssetType.IMAGE);
		className.set ("assets/images/menu/moons/original/Nix.png", __ASSET__assets_images_menu_moons_original_nix_png);
		type.set ("assets/images/menu/moons/original/Nix.png", AssetType.IMAGE);
		className.set ("assets/images/menu/moons/original/Styx.png", __ASSET__assets_images_menu_moons_original_styx_png);
		type.set ("assets/images/menu/moons/original/Styx.png", AssetType.IMAGE);
		className.set ("assets/images/menu/moons/Pluto.png", __ASSET__assets_images_menu_moons_pluto_png);
		type.set ("assets/images/menu/moons/Pluto.png", AssetType.IMAGE);
		className.set ("assets/images/menu/moons/StyxOrbit.png", __ASSET__assets_images_menu_moons_styxorbit_png);
		type.set ("assets/images/menu/moons/StyxOrbit.png", AssetType.IMAGE);
		className.set ("assets/images/menu/splash_x640.png", __ASSET__assets_images_menu_splash_x640_png);
		type.set ("assets/images/menu/splash_x640.png", AssetType.IMAGE);
		className.set ("assets/images/menu/starback.png", __ASSET__assets_images_menu_starback_png);
		type.set ("assets/images/menu/starback.png", AssetType.IMAGE);
		className.set ("assets/images/misc/320xp.pdn", __ASSET__assets_images_misc_320xp_pdn);
		type.set ("assets/images/misc/320xp.pdn", AssetType.TEXT);
		className.set ("assets/images/misc/320xp.png", __ASSET__assets_images_misc_320xp_png);
		type.set ("assets/images/misc/320xp.png", AssetType.IMAGE);
		className.set ("assets/images/misc/earth-32x.png", __ASSET__assets_images_misc_earth_32x_png);
		type.set ("assets/images/misc/earth-32x.png", AssetType.IMAGE);
		className.set ("assets/images/misc/pls.png", __ASSET__assets_images_misc_pls_png);
		type.set ("assets/images/misc/pls.png", AssetType.IMAGE);
		className.set ("assets/images/mute/Mute.png", __ASSET__assets_images_mute_mute_png);
		type.set ("assets/images/mute/Mute.png", AssetType.IMAGE);
		className.set ("assets/images/mute/MuteOn.png", __ASSET__assets_images_mute_muteon_png);
		type.set ("assets/images/mute/MuteOn.png", AssetType.IMAGE);
		className.set ("assets/images/NH.ico", __ASSET__assets_images_nh_ico);
		type.set ("assets/images/NH.ico", AssetType.BINARY);
		className.set ("assets/images/nh_large.svg", __ASSET__assets_images_nh_large_svg);
		type.set ("assets/images/nh_large.svg", AssetType.TEXT);
		className.set ("assets/images/pepssiwire/background.png", __ASSET__assets_images_pepssiwire_background_png);
		type.set ("assets/images/pepssiwire/background.png", AssetType.IMAGE);
		className.set ("assets/images/pepssiwire/bblue.png", __ASSET__assets_images_pepssiwire_bblue_png);
		type.set ("assets/images/pepssiwire/bblue.png", AssetType.IMAGE);
		className.set ("assets/images/pepssiwire/box - Copy.pdn", __ASSET__assets_images_pepssiwire_box___copy_pdn);
		type.set ("assets/images/pepssiwire/box - Copy.pdn", AssetType.TEXT);
		className.set ("assets/images/pepssiwire/box-mockup.pdn", __ASSET__assets_images_pepssiwire_box_mockup_pdn);
		type.set ("assets/images/pepssiwire/box-mockup.pdn", AssetType.TEXT);
		className.set ("assets/images/pepssiwire/box-mockup.png", __ASSET__assets_images_pepssiwire_box_mockup_png);
		type.set ("assets/images/pepssiwire/box-mockup.png", AssetType.IMAGE);
		className.set ("assets/images/pepssiwire/box.pdn", __ASSET__assets_images_pepssiwire_box_pdn);
		type.set ("assets/images/pepssiwire/box.pdn", AssetType.TEXT);
		className.set ("assets/images/pepssiwire/box.png", __ASSET__assets_images_pepssiwire_box_png);
		type.set ("assets/images/pepssiwire/box.png", AssetType.IMAGE);
		className.set ("assets/images/pepssiwire/bparcel.png", __ASSET__assets_images_pepssiwire_bparcel_png);
		type.set ("assets/images/pepssiwire/bparcel.png", AssetType.IMAGE);
		className.set ("assets/images/pepssiwire/bpeach.png", __ASSET__assets_images_pepssiwire_bpeach_png);
		type.set ("assets/images/pepssiwire/bpeach.png", AssetType.IMAGE);
		className.set ("assets/images/pepssiwire/bpink.png", __ASSET__assets_images_pepssiwire_bpink_png);
		type.set ("assets/images/pepssiwire/bpink.png", AssetType.IMAGE);
		className.set ("assets/images/pepssiwire/colors.png", __ASSET__assets_images_pepssiwire_colors_png);
		type.set ("assets/images/pepssiwire/colors.png", AssetType.IMAGE);
		className.set ("assets/images/pepssiwire/dialogback.png", __ASSET__assets_images_pepssiwire_dialogback_png);
		type.set ("assets/images/pepssiwire/dialogback.png", AssetType.IMAGE);
		className.set ("assets/images/pepssiwire/dialogtext.png", __ASSET__assets_images_pepssiwire_dialogtext_png);
		type.set ("assets/images/pepssiwire/dialogtext.png", AssetType.IMAGE);
		className.set ("assets/images/pepssiwire/old/0bluealt.png", __ASSET__assets_images_pepssiwire_old_0bluealt_png);
		type.set ("assets/images/pepssiwire/old/0bluealt.png", AssetType.IMAGE);
		className.set ("assets/images/pepssiwire/old/0limealt.png", __ASSET__assets_images_pepssiwire_old_0limealt_png);
		type.set ("assets/images/pepssiwire/old/0limealt.png", AssetType.IMAGE);
		className.set ("assets/images/pepssiwire/old/0peachalt.png", __ASSET__assets_images_pepssiwire_old_0peachalt_png);
		type.set ("assets/images/pepssiwire/old/0peachalt.png", AssetType.IMAGE);
		className.set ("assets/images/pepssiwire/old/0pinkalt.png", __ASSET__assets_images_pepssiwire_old_0pinkalt_png);
		type.set ("assets/images/pepssiwire/old/0pinkalt.png", AssetType.IMAGE);
		className.set ("assets/images/pepssiwire/old/1bluealt.png", __ASSET__assets_images_pepssiwire_old_1bluealt_png);
		type.set ("assets/images/pepssiwire/old/1bluealt.png", AssetType.IMAGE);
		className.set ("assets/images/pepssiwire/old/1limealt.png", __ASSET__assets_images_pepssiwire_old_1limealt_png);
		type.set ("assets/images/pepssiwire/old/1limealt.png", AssetType.IMAGE);
		className.set ("assets/images/pepssiwire/old/1peachalt.png", __ASSET__assets_images_pepssiwire_old_1peachalt_png);
		type.set ("assets/images/pepssiwire/old/1peachalt.png", AssetType.IMAGE);
		className.set ("assets/images/pepssiwire/old/1pinkalt.png", __ASSET__assets_images_pepssiwire_old_1pinkalt_png);
		type.set ("assets/images/pepssiwire/old/1pinkalt.png", AssetType.IMAGE);
		className.set ("assets/images/pepssiwire/original/0blue.png", __ASSET__assets_images_pepssiwire_original_0blue_png);
		type.set ("assets/images/pepssiwire/original/0blue.png", AssetType.IMAGE);
		className.set ("assets/images/pepssiwire/original/0lime.png", __ASSET__assets_images_pepssiwire_original_0lime_png);
		type.set ("assets/images/pepssiwire/original/0lime.png", AssetType.IMAGE);
		className.set ("assets/images/pepssiwire/original/0peach.png", __ASSET__assets_images_pepssiwire_original_0peach_png);
		type.set ("assets/images/pepssiwire/original/0peach.png", AssetType.IMAGE);
		className.set ("assets/images/pepssiwire/original/0pink.png", __ASSET__assets_images_pepssiwire_original_0pink_png);
		type.set ("assets/images/pepssiwire/original/0pink.png", AssetType.IMAGE);
		className.set ("assets/images/pepssiwire/parcel.pdn", __ASSET__assets_images_pepssiwire_parcel_pdn);
		type.set ("assets/images/pepssiwire/parcel.pdn", AssetType.TEXT);
		className.set ("assets/images/pepssiwire/parcel.png", __ASSET__assets_images_pepssiwire_parcel_png);
		type.set ("assets/images/pepssiwire/parcel.png", AssetType.IMAGE);
		className.set ("assets/images/pepssiwire/sgsgsg.pdn", __ASSET__assets_images_pepssiwire_sgsgsg_pdn);
		type.set ("assets/images/pepssiwire/sgsgsg.pdn", AssetType.TEXT);
		className.set ("assets/images/pepssiwire/Untitled.pdn", __ASSET__assets_images_pepssiwire_untitled_pdn);
		type.set ("assets/images/pepssiwire/Untitled.pdn", AssetType.TEXT);
		className.set ("assets/images/pepssiwire/Untitled.png", __ASSET__assets_images_pepssiwire_untitled_png);
		type.set ("assets/images/pepssiwire/Untitled.png", AssetType.IMAGE);
		className.set ("assets/images/reference.txt", __ASSET__assets_images_reference_txt);
		type.set ("assets/images/reference.txt", AssetType.TEXT);
		className.set ("assets/images/rtgrun/background.pdn", __ASSET__assets_images_rtgrun_background_pdn);
		type.set ("assets/images/rtgrun/background.pdn", AssetType.TEXT);
		className.set ("assets/images/rtgrun/background.png", __ASSET__assets_images_rtgrun_background_png);
		type.set ("assets/images/rtgrun/background.png", AssetType.IMAGE);
		className.set ("assets/images/rtgrun/clouds.png", __ASSET__assets_images_rtgrun_clouds_png);
		type.set ("assets/images/rtgrun/clouds.png", AssetType.IMAGE);
		className.set ("assets/images/rtgrun/mockup.pdn", __ASSET__assets_images_rtgrun_mockup_pdn);
		type.set ("assets/images/rtgrun/mockup.pdn", AssetType.TEXT);
		className.set ("assets/images/rtgrun/placeholder.pdn", __ASSET__assets_images_rtgrun_placeholder_pdn);
		type.set ("assets/images/rtgrun/placeholder.pdn", AssetType.TEXT);
		className.set ("assets/images/rtgrun/placeholder.png", __ASSET__assets_images_rtgrun_placeholder_png);
		type.set ("assets/images/rtgrun/placeholder.png", AssetType.IMAGE);
		className.set ("assets/images/rtgrun/sky.png", __ASSET__assets_images_rtgrun_sky_png);
		type.set ("assets/images/rtgrun/sky.png", AssetType.IMAGE);
		className.set ("assets/images/settings/button_fullscreen.png", __ASSET__assets_images_settings_button_fullscreen_png);
		type.set ("assets/images/settings/button_fullscreen.png", AssetType.IMAGE);
		className.set ("assets/images/settings/button_fullscreen_alt.png", __ASSET__assets_images_settings_button_fullscreen_alt_png);
		type.set ("assets/images/settings/button_fullscreen_alt.png", AssetType.IMAGE);
		className.set ("assets/images/settings/button_sound.png", __ASSET__assets_images_settings_button_sound_png);
		type.set ("assets/images/settings/button_sound.png", AssetType.IMAGE);
		className.set ("assets/images/settings/button_sound_alt.png", __ASSET__assets_images_settings_button_sound_alt_png);
		type.set ("assets/images/settings/button_sound_alt.png", AssetType.IMAGE);
		className.set ("assets/images/settings/originals/button_fullscreen.pdn", __ASSET__assets_images_settings_originals_button_fullscreen_pdn);
		type.set ("assets/images/settings/originals/button_fullscreen.pdn", AssetType.TEXT);
		className.set ("assets/images/settings/originals/button_sound.pdn", __ASSET__assets_images_settings_originals_button_sound_pdn);
		type.set ("assets/images/settings/originals/button_sound.pdn", AssetType.TEXT);
		className.set ("assets/images/settings/title_settings.png", __ASSET__assets_images_settings_title_settings_png);
		type.set ("assets/images/settings/title_settings.png", AssetType.IMAGE);
		className.set ("assets/music/menu-main2.wav", __ASSET__assets_music_menu_main2_wav);
		type.set ("assets/music/menu-main2.wav", AssetType.SOUND);
		className.set ("assets/music/music_credits.txt", __ASSET__assets_music_music_credits_txt);
		type.set ("assets/music/music_credits.txt", AssetType.TEXT);
		className.set ("assets/sounds/data.wav", __ASSET__assets_sounds_data_wav);
		type.set ("assets/sounds/data.wav", AssetType.SOUND);
		className.set ("assets/sounds/error.wav", __ASSET__assets_sounds_error_wav);
		type.set ("assets/sounds/error.wav", AssetType.SOUND);
		className.set ("assets/sounds/get.wav", __ASSET__assets_sounds_get_wav);
		type.set ("assets/sounds/get.wav", AssetType.SOUND);
		className.set ("assets/sounds/introtone.mp3", __ASSET__assets_sounds_introtone_mp3);
		type.set ("assets/sounds/introtone.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/introtone.wav", __ASSET__assets_sounds_introtone_wav);
		type.set ("assets/sounds/introtone.wav", AssetType.SOUND);
		className.set ("assets/sounds/Pickup_Coin.wav", __ASSET__assets_sounds_pickup_coin_wav);
		type.set ("assets/sounds/Pickup_Coin.wav", AssetType.SOUND);
		className.set ("assets/sounds/select.wav", __ASSET__assets_sounds_select_wav);
		type.set ("assets/sounds/select.wav", AssetType.SOUND);
		className.set ("assets/sounds/signal.wav", __ASSET__assets_sounds_signal_wav);
		type.set ("assets/sounds/signal.wav", AssetType.SOUND);
		path.set ("assets/sounds/beep.ogg", "assets/sounds/beep.ogg");
		type.set ("assets/sounds/beep.ogg", AssetType.SOUND);
		path.set ("assets/sounds/flixel.ogg", "assets/sounds/flixel.ogg");
		type.set ("assets/sounds/flixel.ogg", AssetType.SOUND);
		className.set ("assets/fonts/nokiafc22.ttf", __ASSET__assets_fonts_nokiafc22_ttf);
		type.set ("assets/fonts/nokiafc22.ttf", AssetType.FONT);
		className.set ("assets/fonts/arial.ttf", __ASSET__assets_fonts_arial_ttf);
		type.set ("assets/fonts/arial.ttf", AssetType.FONT);
		
		
		#elseif html5
		
		var id;
		id = "assets/data/alicemap.oep";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/data/maze.oel";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/data/plats.oel";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/data/rtgmap.oep";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/fonts/OratorStd.otf";
		className.set (id, __ASSET__assets_fonts_oratorstd_otf);
		
		type.set (id, AssetType.FONT);
		id = "assets/images/!originals/bt_orig/comp_alice_alt.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/!originals/bt_orig/comp_alice_hover.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/!originals/bt_orig/comp_lorri_alt.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/!originals/bt_orig/comp_lorri_hover.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/!originals/bt_orig/comp_pepssi_alt.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/!originals/bt_orig/comp_pepssi_hover.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/!originals/bt_orig/comp_ralph_alt.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/!originals/bt_orig/comp_ralph_hover.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/!originals/intro_originals/beach.pdn";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/images/!originals/intro_originals/Untitled.pdn";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/images/!originals/intro_originals/vab.pdn";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/images/!originals/launchblock_other/nh-atlas-v.pdn";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/images/!originals/launchblock_other/nh-launch-block/Atlas_V_551_with_New_Horizons_on_Launch_Pad_41.jpg";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/!originals/launchblock_other/nh-launch-block/nh-static-atlasv-launch.jpg";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/!originals/launchblock_other/nh-launch-block.pdn";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/images/!originals/launchblock_other/nh-launch-block.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/!originals/launchblock_other/nh-launch-long - Copy.pdn";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/images/!originals/launchblock_other/nh-launch-long-old.pdn";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/images/!originals/launchblock_other/nh-launch-long.pdn";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/images/!originals/launchblock_other/nh-launch-long.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/!originals/launchblock_other/nh-pastel.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/!originals/launchblock_other/nh-postcard - Copy.pdn";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/images/!originals/launchblock_other/nh-postcard - Copy.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/!originals/launchblock_other/nh-postcard.pdn";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/images/!originals/launchblock_other/nh-postcard.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/!originals/launchblock_other/pad-norocket.pdn";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/images/!originals/launchblock_other/pad-rocket.pdn";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/images/!originals/splash/splash_x640.jpg";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/!originals/splash/startup-splash-hero - Copy.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/!originals/splash/startup-splash-hero.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/!originals/stemlogo.pdn";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/images/about/stemlogo.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/about/title_about.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/alicemaze/alice_hit.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/alicemaze/b-bottom.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/alicemaze/b-full.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/alicemaze/b-hori.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/alicemaze/b-island.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/alicemaze/b-lb.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/alicemaze/b-left.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/alicemaze/b-map.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/alicemaze/b-rb.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/alicemaze/b-right.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/alicemaze/b-top.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/alicemaze/b-ul.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/alicemaze/b-ur.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/alicemaze/b-vert.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/alicemaze/cleaner.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/alicemaze/dialogue/alice_dialogue_back.pdn";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/images/alicemaze/dialogue/alice_dialogue_back.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/alicemaze/dialogue/OldManNormal.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/alicemaze/dialogue/speak0.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/alicemaze/dialogue/speak_0.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/alicemaze/dialogue/speak_template.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/alicemaze/dialogue/tag.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/alicemaze/dialogue/wasd/wasd_a.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/alicemaze/dialogue/wasd/wasd_d.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/alicemaze/dialogue/wasd/wasd_finger.pdn";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/images/alicemaze/dialogue/wasd/wasd_s.pdn";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/images/alicemaze/dialogue/wasd/wasd_s.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/alicemaze/dialogue/wasd/wasd_template.pdn";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/images/alicemaze/dialogue/wasd/wasd_w.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/alicemaze/dialogue/wasd.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/alicemaze/player.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/component/buttonsprites/comp_alice_alt.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/component/buttonsprites/comp_alice_d.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/component/buttonsprites/comp_heat_alt.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/component/buttonsprites/comp_heat_d.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/component/buttonsprites/comp_lorri_alt.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/component/buttonsprites/comp_lorri_d.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/component/buttonsprites/comp_pepssi_alt.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/component/buttonsprites/comp_pepssi_d.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/component/buttonsprites/comp_ralph_alt.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/component/buttonsprites/comp_ralph_d.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/component/buttonsprites/comp_rex_alt.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/component/buttonsprites/comp_rex_d.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/component/buttonsprites/comp_rtg_alt.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/component/buttonsprites/comp_rtg_d.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/component/buttonsprites/comp_swap_alt.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/component/buttonsprites/comp_swap_d.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/component/buttonsprites/template.pdn";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/images/component/comp_alice.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/component/comp_heatshield.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/component/comp_lorri.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/component/comp_pepssi.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/component/comp_ralph.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/component/comp_rex.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/component/comp_rtg.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/component/comp_swap.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/component/NH.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/component/nh_large.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/facts/fact0.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/facts/fact1.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/facts/fact2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/facts/fact3.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/found/alice_button_backdrop.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/found/found_alice.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/found/found_alice_button.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/found/found_originals/alicefound.pdn";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/images/found/found_originals/found-template.pdn";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/images/found/found_originals/found_alice_button.pdn";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/images/found/found_originals/rtg_found.pdn";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/images/found/found_pepssi.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/found/found_pepssi_button.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/hub/alice_info.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/hub/blockout.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/hub/components_hero.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/hub/heat_info.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/hub/lorri_info.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/hub/pepssi_info.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/hub/ralph_info.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/hub/rex_info.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/hub/rtg_info.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/hub/swap_info.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/intro/beach.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/intro/name.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/intro/plane.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/intro/text0.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/intro/text1.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/intro/text2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/intro/text3.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/intro/tower.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/intro/tutorial.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/intro/vab.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/launchblock/cloud0.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/launchblock/cloud1.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/launchblock/launch-thin-window.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/launchblock/launch-thin-window.png.meta";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/images/launchblock/nh-atlas-v.pdn.meta";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/images/launchblock/nh-launch-block.pdn.meta";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/images/launchblock/nh-launch-block.png.meta";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/images/launchblock/nh-launch-long - Copy.pdn.meta";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/images/launchblock/nh-launch-long-old.pdn.meta";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/images/launchblock/nh-launch-long.pdn.meta";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/images/launchblock/nh-launch-long.png.meta";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/images/launchblock/nh-pastel.png.meta";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/images/launchblock/nh-postcard - Copy - Copy.png.meta";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/images/launchblock/nh-postcard - Copy.pdn.meta";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/images/launchblock/nh-postcard - Copy.png.meta";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/images/launchblock/nh-postcard-skeu.png.meta";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/images/launchblock/nh-postcard.pdn.meta";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/images/launchblock/nh-postcard.png.meta";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/images/launchblock/pad-norocket.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/launchblock/pad-rocket.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/launchblock/skyback - Copy.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/launchblock/skyback.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/logo.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/logoflicker.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/menu/button originals/buttontemplate - Copy.pdn";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/images/menu/button originals/button_begin.pdn";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/images/menu/button originals/button_mute.pdn";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/images/menu/button originals/button_pad.pdn";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/images/menu/button originals/button_quit.pdn";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/images/menu/button originals/button_settings.pdn";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/images/menu/button originals/d_warning.pdn";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/images/menu/buttontemplate.pdn";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/images/menu/button_about.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/menu/button_back.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/menu/button_begin.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/menu/button_debug.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/menu/button_f.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/menu/button_facts.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/menu/button_full.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/menu/button_pad.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/menu/button_pluto.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/menu/button_quit.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/menu/button_rand.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/menu/button_setting.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/menu/button_settings.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/menu/coordsblock.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/menu/d_warning.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/menu/d_warn_cancel.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/menu/d_warn_ok.pdn";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/images/menu/d_warn_ok.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/menu/full_exit_notice.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/menu/moons/CharonOrbit.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/menu/moons/HydraOrbit.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/menu/moons/KerberosOrbit.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/menu/moons/NixOrbit.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/menu/moons/original/Charon.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/menu/moons/original/Hydra.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/menu/moons/original/Kerberos.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/menu/moons/original/Nix.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/menu/moons/original/Styx.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/menu/moons/Pluto.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/menu/moons/StyxOrbit.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/menu/splash_x640.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/menu/starback.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/misc/320xp.pdn";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/images/misc/320xp.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/misc/earth-32x.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/misc/pls.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/mute/Mute.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/mute/MuteOn.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/NH.ico";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "assets/images/nh_large.svg";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/images/pepssiwire/background.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/pepssiwire/bblue.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/pepssiwire/box - Copy.pdn";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/images/pepssiwire/box-mockup.pdn";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/images/pepssiwire/box-mockup.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/pepssiwire/box.pdn";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/images/pepssiwire/box.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/pepssiwire/bparcel.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/pepssiwire/bpeach.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/pepssiwire/bpink.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/pepssiwire/colors.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/pepssiwire/dialogback.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/pepssiwire/dialogtext.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/pepssiwire/old/0bluealt.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/pepssiwire/old/0limealt.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/pepssiwire/old/0peachalt.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/pepssiwire/old/0pinkalt.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/pepssiwire/old/1bluealt.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/pepssiwire/old/1limealt.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/pepssiwire/old/1peachalt.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/pepssiwire/old/1pinkalt.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/pepssiwire/original/0blue.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/pepssiwire/original/0lime.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/pepssiwire/original/0peach.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/pepssiwire/original/0pink.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/pepssiwire/parcel.pdn";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/images/pepssiwire/parcel.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/pepssiwire/sgsgsg.pdn";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/images/pepssiwire/Untitled.pdn";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/images/pepssiwire/Untitled.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/reference.txt";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/images/rtgrun/background.pdn";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/images/rtgrun/background.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/rtgrun/clouds.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/rtgrun/mockup.pdn";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/images/rtgrun/placeholder.pdn";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/images/rtgrun/placeholder.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/rtgrun/sky.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/settings/button_fullscreen.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/settings/button_fullscreen_alt.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/settings/button_sound.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/settings/button_sound_alt.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/settings/originals/button_fullscreen.pdn";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/images/settings/originals/button_sound.pdn";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/images/settings/title_settings.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/music/menu-main2.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/music/music_credits.txt";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/sounds/data.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/error.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/get.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/introtone.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/introtone.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/Pickup_Coin.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/select.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/signal.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/beep.ogg";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/flixel.ogg";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/fonts/nokiafc22.ttf";
		className.set (id, __ASSET__assets_fonts_nokiafc22_ttf);
		
		type.set (id, AssetType.FONT);
		id = "assets/fonts/arial.ttf";
		className.set (id, __ASSET__assets_fonts_arial_ttf);
		
		type.set (id, AssetType.FONT);
		
		
		var assetsPrefix = null;
		if (ApplicationMain.config != null && Reflect.hasField (ApplicationMain.config, "assetsPrefix")) {
			assetsPrefix = ApplicationMain.config.assetsPrefix;
		}
		if (assetsPrefix != null) {
			for (k in path.keys()) {
				path.set(k, assetsPrefix + path[k]);
			}
		}
		
		#else
		
		#if (windows || mac || linux)
		
		var useManifest = false;
		
		className.set ("assets/data/alicemap.oep", __ASSET__assets_data_alicemap_oep);
		type.set ("assets/data/alicemap.oep", AssetType.TEXT);
		
		className.set ("assets/data/maze.oel", __ASSET__assets_data_maze_oel);
		type.set ("assets/data/maze.oel", AssetType.TEXT);
		
		className.set ("assets/data/plats.oel", __ASSET__assets_data_plats_oel);
		type.set ("assets/data/plats.oel", AssetType.TEXT);
		
		className.set ("assets/data/rtgmap.oep", __ASSET__assets_data_rtgmap_oep);
		type.set ("assets/data/rtgmap.oep", AssetType.TEXT);
		
		className.set ("assets/fonts/OratorStd.otf", __ASSET__assets_fonts_oratorstd_otf);
		type.set ("assets/fonts/OratorStd.otf", AssetType.FONT);
		
		className.set ("assets/images/!originals/bt_orig/comp_alice_alt.png", __ASSET__assets_images__originals_bt_orig_comp_alice_alt_png);
		type.set ("assets/images/!originals/bt_orig/comp_alice_alt.png", AssetType.IMAGE);
		
		className.set ("assets/images/!originals/bt_orig/comp_alice_hover.png", __ASSET__assets_images__originals_bt_orig_comp_alice_hover_png);
		type.set ("assets/images/!originals/bt_orig/comp_alice_hover.png", AssetType.IMAGE);
		
		className.set ("assets/images/!originals/bt_orig/comp_lorri_alt.png", __ASSET__assets_images__originals_bt_orig_comp_lorri_alt_png);
		type.set ("assets/images/!originals/bt_orig/comp_lorri_alt.png", AssetType.IMAGE);
		
		className.set ("assets/images/!originals/bt_orig/comp_lorri_hover.png", __ASSET__assets_images__originals_bt_orig_comp_lorri_hover_png);
		type.set ("assets/images/!originals/bt_orig/comp_lorri_hover.png", AssetType.IMAGE);
		
		className.set ("assets/images/!originals/bt_orig/comp_pepssi_alt.png", __ASSET__assets_images__originals_bt_orig_comp_pepssi_alt_png);
		type.set ("assets/images/!originals/bt_orig/comp_pepssi_alt.png", AssetType.IMAGE);
		
		className.set ("assets/images/!originals/bt_orig/comp_pepssi_hover.png", __ASSET__assets_images__originals_bt_orig_comp_pepssi_hover_png);
		type.set ("assets/images/!originals/bt_orig/comp_pepssi_hover.png", AssetType.IMAGE);
		
		className.set ("assets/images/!originals/bt_orig/comp_ralph_alt.png", __ASSET__assets_images__originals_bt_orig_comp_ralph_alt_png);
		type.set ("assets/images/!originals/bt_orig/comp_ralph_alt.png", AssetType.IMAGE);
		
		className.set ("assets/images/!originals/bt_orig/comp_ralph_hover.png", __ASSET__assets_images__originals_bt_orig_comp_ralph_hover_png);
		type.set ("assets/images/!originals/bt_orig/comp_ralph_hover.png", AssetType.IMAGE);
		
		className.set ("assets/images/!originals/intro_originals/beach.pdn", __ASSET__assets_images__originals_intro_originals_beach_pdn);
		type.set ("assets/images/!originals/intro_originals/beach.pdn", AssetType.TEXT);
		
		className.set ("assets/images/!originals/intro_originals/Untitled.pdn", __ASSET__assets_images__originals_intro_originals_untitled_pdn);
		type.set ("assets/images/!originals/intro_originals/Untitled.pdn", AssetType.TEXT);
		
		className.set ("assets/images/!originals/intro_originals/vab.pdn", __ASSET__assets_images__originals_intro_originals_vab_pdn);
		type.set ("assets/images/!originals/intro_originals/vab.pdn", AssetType.TEXT);
		
		className.set ("assets/images/!originals/launchblock_other/nh-atlas-v.pdn", __ASSET__assets_images__originals_launchblock_other_nh_atlas_v_pdn);
		type.set ("assets/images/!originals/launchblock_other/nh-atlas-v.pdn", AssetType.TEXT);
		
		className.set ("assets/images/!originals/launchblock_other/nh-launch-block/Atlas_V_551_with_New_Horizons_on_Launch_Pad_41.jpg", __ASSET__assets_images__originals_launchblock_other_nh_launch_block_atlas_v_551_with_new_horizons_on_launch_pad_41_jpg);
		type.set ("assets/images/!originals/launchblock_other/nh-launch-block/Atlas_V_551_with_New_Horizons_on_Launch_Pad_41.jpg", AssetType.IMAGE);
		
		className.set ("assets/images/!originals/launchblock_other/nh-launch-block/nh-static-atlasv-launch.jpg", __ASSET__assets_images__originals_launchblock_other_nh_launch_block_nh_static_atlasv_launch_jpg);
		type.set ("assets/images/!originals/launchblock_other/nh-launch-block/nh-static-atlasv-launch.jpg", AssetType.IMAGE);
		
		className.set ("assets/images/!originals/launchblock_other/nh-launch-block.pdn", __ASSET__assets_images__originals_launchblock_other_nh_launch_block_pdn);
		type.set ("assets/images/!originals/launchblock_other/nh-launch-block.pdn", AssetType.TEXT);
		
		className.set ("assets/images/!originals/launchblock_other/nh-launch-block.png", __ASSET__assets_images__originals_launchblock_other_nh_launch_block_png);
		type.set ("assets/images/!originals/launchblock_other/nh-launch-block.png", AssetType.IMAGE);
		
		className.set ("assets/images/!originals/launchblock_other/nh-launch-long - Copy.pdn", __ASSET__assets_images__originals_launchblock_other_nh_launch_long___copy_pdn);
		type.set ("assets/images/!originals/launchblock_other/nh-launch-long - Copy.pdn", AssetType.TEXT);
		
		className.set ("assets/images/!originals/launchblock_other/nh-launch-long-old.pdn", __ASSET__assets_images__originals_launchblock_other_nh_launch_long_old_pdn);
		type.set ("assets/images/!originals/launchblock_other/nh-launch-long-old.pdn", AssetType.TEXT);
		
		className.set ("assets/images/!originals/launchblock_other/nh-launch-long.pdn", __ASSET__assets_images__originals_launchblock_other_nh_launch_long_pdn);
		type.set ("assets/images/!originals/launchblock_other/nh-launch-long.pdn", AssetType.TEXT);
		
		className.set ("assets/images/!originals/launchblock_other/nh-launch-long.png", __ASSET__assets_images__originals_launchblock_other_nh_launch_long_png);
		type.set ("assets/images/!originals/launchblock_other/nh-launch-long.png", AssetType.IMAGE);
		
		className.set ("assets/images/!originals/launchblock_other/nh-pastel.png", __ASSET__assets_images__originals_launchblock_other_nh_pastel_png);
		type.set ("assets/images/!originals/launchblock_other/nh-pastel.png", AssetType.IMAGE);
		
		className.set ("assets/images/!originals/launchblock_other/nh-postcard - Copy.pdn", __ASSET__assets_images__originals_launchblock_other_nh_postcard___copy_pdn);
		type.set ("assets/images/!originals/launchblock_other/nh-postcard - Copy.pdn", AssetType.TEXT);
		
		className.set ("assets/images/!originals/launchblock_other/nh-postcard - Copy.png", __ASSET__assets_images__originals_launchblock_other_nh_postcard___copy_png);
		type.set ("assets/images/!originals/launchblock_other/nh-postcard - Copy.png", AssetType.IMAGE);
		
		className.set ("assets/images/!originals/launchblock_other/nh-postcard.pdn", __ASSET__assets_images__originals_launchblock_other_nh_postcard_pdn);
		type.set ("assets/images/!originals/launchblock_other/nh-postcard.pdn", AssetType.TEXT);
		
		className.set ("assets/images/!originals/launchblock_other/nh-postcard.png", __ASSET__assets_images__originals_launchblock_other_nh_postcard_png);
		type.set ("assets/images/!originals/launchblock_other/nh-postcard.png", AssetType.IMAGE);
		
		className.set ("assets/images/!originals/launchblock_other/pad-norocket.pdn", __ASSET__assets_images__originals_launchblock_other_pad_norocket_pdn);
		type.set ("assets/images/!originals/launchblock_other/pad-norocket.pdn", AssetType.TEXT);
		
		className.set ("assets/images/!originals/launchblock_other/pad-rocket.pdn", __ASSET__assets_images__originals_launchblock_other_pad_rocket_pdn);
		type.set ("assets/images/!originals/launchblock_other/pad-rocket.pdn", AssetType.TEXT);
		
		className.set ("assets/images/!originals/splash/splash_x640.jpg", __ASSET__assets_images__originals_splash_splash_x640_jpg);
		type.set ("assets/images/!originals/splash/splash_x640.jpg", AssetType.IMAGE);
		
		className.set ("assets/images/!originals/splash/startup-splash-hero - Copy.png", __ASSET__assets_images__originals_splash_startup_splash_hero___copy_png);
		type.set ("assets/images/!originals/splash/startup-splash-hero - Copy.png", AssetType.IMAGE);
		
		className.set ("assets/images/!originals/splash/startup-splash-hero.png", __ASSET__assets_images__originals_splash_startup_splash_hero_png);
		type.set ("assets/images/!originals/splash/startup-splash-hero.png", AssetType.IMAGE);
		
		className.set ("assets/images/!originals/stemlogo.pdn", __ASSET__assets_images__originals_stemlogo_pdn);
		type.set ("assets/images/!originals/stemlogo.pdn", AssetType.TEXT);
		
		className.set ("assets/images/about/stemlogo.png", __ASSET__assets_images_about_stemlogo_png);
		type.set ("assets/images/about/stemlogo.png", AssetType.IMAGE);
		
		className.set ("assets/images/about/title_about.png", __ASSET__assets_images_about_title_about_png);
		type.set ("assets/images/about/title_about.png", AssetType.IMAGE);
		
		className.set ("assets/images/alicemaze/alice_hit.png", __ASSET__assets_images_alicemaze_alice_hit_png);
		type.set ("assets/images/alicemaze/alice_hit.png", AssetType.IMAGE);
		
		className.set ("assets/images/alicemaze/b-bottom.png", __ASSET__assets_images_alicemaze_b_bottom_png);
		type.set ("assets/images/alicemaze/b-bottom.png", AssetType.IMAGE);
		
		className.set ("assets/images/alicemaze/b-full.png", __ASSET__assets_images_alicemaze_b_full_png);
		type.set ("assets/images/alicemaze/b-full.png", AssetType.IMAGE);
		
		className.set ("assets/images/alicemaze/b-hori.png", __ASSET__assets_images_alicemaze_b_hori_png);
		type.set ("assets/images/alicemaze/b-hori.png", AssetType.IMAGE);
		
		className.set ("assets/images/alicemaze/b-island.png", __ASSET__assets_images_alicemaze_b_island_png);
		type.set ("assets/images/alicemaze/b-island.png", AssetType.IMAGE);
		
		className.set ("assets/images/alicemaze/b-lb.png", __ASSET__assets_images_alicemaze_b_lb_png);
		type.set ("assets/images/alicemaze/b-lb.png", AssetType.IMAGE);
		
		className.set ("assets/images/alicemaze/b-left.png", __ASSET__assets_images_alicemaze_b_left_png);
		type.set ("assets/images/alicemaze/b-left.png", AssetType.IMAGE);
		
		className.set ("assets/images/alicemaze/b-map.png", __ASSET__assets_images_alicemaze_b_map_png);
		type.set ("assets/images/alicemaze/b-map.png", AssetType.IMAGE);
		
		className.set ("assets/images/alicemaze/b-rb.png", __ASSET__assets_images_alicemaze_b_rb_png);
		type.set ("assets/images/alicemaze/b-rb.png", AssetType.IMAGE);
		
		className.set ("assets/images/alicemaze/b-right.png", __ASSET__assets_images_alicemaze_b_right_png);
		type.set ("assets/images/alicemaze/b-right.png", AssetType.IMAGE);
		
		className.set ("assets/images/alicemaze/b-top.png", __ASSET__assets_images_alicemaze_b_top_png);
		type.set ("assets/images/alicemaze/b-top.png", AssetType.IMAGE);
		
		className.set ("assets/images/alicemaze/b-ul.png", __ASSET__assets_images_alicemaze_b_ul_png);
		type.set ("assets/images/alicemaze/b-ul.png", AssetType.IMAGE);
		
		className.set ("assets/images/alicemaze/b-ur.png", __ASSET__assets_images_alicemaze_b_ur_png);
		type.set ("assets/images/alicemaze/b-ur.png", AssetType.IMAGE);
		
		className.set ("assets/images/alicemaze/b-vert.png", __ASSET__assets_images_alicemaze_b_vert_png);
		type.set ("assets/images/alicemaze/b-vert.png", AssetType.IMAGE);
		
		className.set ("assets/images/alicemaze/cleaner.png", __ASSET__assets_images_alicemaze_cleaner_png);
		type.set ("assets/images/alicemaze/cleaner.png", AssetType.IMAGE);
		
		className.set ("assets/images/alicemaze/dialogue/alice_dialogue_back.pdn", __ASSET__assets_images_alicemaze_dialogue_alice_dialogue_back_pdn);
		type.set ("assets/images/alicemaze/dialogue/alice_dialogue_back.pdn", AssetType.TEXT);
		
		className.set ("assets/images/alicemaze/dialogue/alice_dialogue_back.png", __ASSET__assets_images_alicemaze_dialogue_alice_dialogue_back_png);
		type.set ("assets/images/alicemaze/dialogue/alice_dialogue_back.png", AssetType.IMAGE);
		
		className.set ("assets/images/alicemaze/dialogue/OldManNormal.png", __ASSET__assets_images_alicemaze_dialogue_oldmannormal_png);
		type.set ("assets/images/alicemaze/dialogue/OldManNormal.png", AssetType.IMAGE);
		
		className.set ("assets/images/alicemaze/dialogue/speak0.png", __ASSET__assets_images_alicemaze_dialogue_speak0_png);
		type.set ("assets/images/alicemaze/dialogue/speak0.png", AssetType.IMAGE);
		
		className.set ("assets/images/alicemaze/dialogue/speak_0.png", __ASSET__assets_images_alicemaze_dialogue_speak_0_png);
		type.set ("assets/images/alicemaze/dialogue/speak_0.png", AssetType.IMAGE);
		
		className.set ("assets/images/alicemaze/dialogue/speak_template.png", __ASSET__assets_images_alicemaze_dialogue_speak_template_png);
		type.set ("assets/images/alicemaze/dialogue/speak_template.png", AssetType.IMAGE);
		
		className.set ("assets/images/alicemaze/dialogue/tag.png", __ASSET__assets_images_alicemaze_dialogue_tag_png);
		type.set ("assets/images/alicemaze/dialogue/tag.png", AssetType.IMAGE);
		
		className.set ("assets/images/alicemaze/dialogue/wasd/wasd_a.png", __ASSET__assets_images_alicemaze_dialogue_wasd_wasd_a_png);
		type.set ("assets/images/alicemaze/dialogue/wasd/wasd_a.png", AssetType.IMAGE);
		
		className.set ("assets/images/alicemaze/dialogue/wasd/wasd_d.png", __ASSET__assets_images_alicemaze_dialogue_wasd_wasd_d_png);
		type.set ("assets/images/alicemaze/dialogue/wasd/wasd_d.png", AssetType.IMAGE);
		
		className.set ("assets/images/alicemaze/dialogue/wasd/wasd_finger.pdn", __ASSET__assets_images_alicemaze_dialogue_wasd_wasd_finger_pdn);
		type.set ("assets/images/alicemaze/dialogue/wasd/wasd_finger.pdn", AssetType.TEXT);
		
		className.set ("assets/images/alicemaze/dialogue/wasd/wasd_s.pdn", __ASSET__assets_images_alicemaze_dialogue_wasd_wasd_s_pdn);
		type.set ("assets/images/alicemaze/dialogue/wasd/wasd_s.pdn", AssetType.TEXT);
		
		className.set ("assets/images/alicemaze/dialogue/wasd/wasd_s.png", __ASSET__assets_images_alicemaze_dialogue_wasd_wasd_s_png);
		type.set ("assets/images/alicemaze/dialogue/wasd/wasd_s.png", AssetType.IMAGE);
		
		className.set ("assets/images/alicemaze/dialogue/wasd/wasd_template.pdn", __ASSET__assets_images_alicemaze_dialogue_wasd_wasd_template_pdn);
		type.set ("assets/images/alicemaze/dialogue/wasd/wasd_template.pdn", AssetType.TEXT);
		
		className.set ("assets/images/alicemaze/dialogue/wasd/wasd_w.png", __ASSET__assets_images_alicemaze_dialogue_wasd_wasd_w_png);
		type.set ("assets/images/alicemaze/dialogue/wasd/wasd_w.png", AssetType.IMAGE);
		
		className.set ("assets/images/alicemaze/dialogue/wasd.png", __ASSET__assets_images_alicemaze_dialogue_wasd_png);
		type.set ("assets/images/alicemaze/dialogue/wasd.png", AssetType.IMAGE);
		
		className.set ("assets/images/alicemaze/player.png", __ASSET__assets_images_alicemaze_player_png);
		type.set ("assets/images/alicemaze/player.png", AssetType.IMAGE);
		
		className.set ("assets/images/component/buttonsprites/comp_alice_alt.png", __ASSET__assets_images_component_buttonsprites_comp_alice_alt_png);
		type.set ("assets/images/component/buttonsprites/comp_alice_alt.png", AssetType.IMAGE);
		
		className.set ("assets/images/component/buttonsprites/comp_alice_d.png", __ASSET__assets_images_component_buttonsprites_comp_alice_d_png);
		type.set ("assets/images/component/buttonsprites/comp_alice_d.png", AssetType.IMAGE);
		
		className.set ("assets/images/component/buttonsprites/comp_heat_alt.png", __ASSET__assets_images_component_buttonsprites_comp_heat_alt_png);
		type.set ("assets/images/component/buttonsprites/comp_heat_alt.png", AssetType.IMAGE);
		
		className.set ("assets/images/component/buttonsprites/comp_heat_d.png", __ASSET__assets_images_component_buttonsprites_comp_heat_d_png);
		type.set ("assets/images/component/buttonsprites/comp_heat_d.png", AssetType.IMAGE);
		
		className.set ("assets/images/component/buttonsprites/comp_lorri_alt.png", __ASSET__assets_images_component_buttonsprites_comp_lorri_alt_png);
		type.set ("assets/images/component/buttonsprites/comp_lorri_alt.png", AssetType.IMAGE);
		
		className.set ("assets/images/component/buttonsprites/comp_lorri_d.png", __ASSET__assets_images_component_buttonsprites_comp_lorri_d_png);
		type.set ("assets/images/component/buttonsprites/comp_lorri_d.png", AssetType.IMAGE);
		
		className.set ("assets/images/component/buttonsprites/comp_pepssi_alt.png", __ASSET__assets_images_component_buttonsprites_comp_pepssi_alt_png);
		type.set ("assets/images/component/buttonsprites/comp_pepssi_alt.png", AssetType.IMAGE);
		
		className.set ("assets/images/component/buttonsprites/comp_pepssi_d.png", __ASSET__assets_images_component_buttonsprites_comp_pepssi_d_png);
		type.set ("assets/images/component/buttonsprites/comp_pepssi_d.png", AssetType.IMAGE);
		
		className.set ("assets/images/component/buttonsprites/comp_ralph_alt.png", __ASSET__assets_images_component_buttonsprites_comp_ralph_alt_png);
		type.set ("assets/images/component/buttonsprites/comp_ralph_alt.png", AssetType.IMAGE);
		
		className.set ("assets/images/component/buttonsprites/comp_ralph_d.png", __ASSET__assets_images_component_buttonsprites_comp_ralph_d_png);
		type.set ("assets/images/component/buttonsprites/comp_ralph_d.png", AssetType.IMAGE);
		
		className.set ("assets/images/component/buttonsprites/comp_rex_alt.png", __ASSET__assets_images_component_buttonsprites_comp_rex_alt_png);
		type.set ("assets/images/component/buttonsprites/comp_rex_alt.png", AssetType.IMAGE);
		
		className.set ("assets/images/component/buttonsprites/comp_rex_d.png", __ASSET__assets_images_component_buttonsprites_comp_rex_d_png);
		type.set ("assets/images/component/buttonsprites/comp_rex_d.png", AssetType.IMAGE);
		
		className.set ("assets/images/component/buttonsprites/comp_rtg_alt.png", __ASSET__assets_images_component_buttonsprites_comp_rtg_alt_png);
		type.set ("assets/images/component/buttonsprites/comp_rtg_alt.png", AssetType.IMAGE);
		
		className.set ("assets/images/component/buttonsprites/comp_rtg_d.png", __ASSET__assets_images_component_buttonsprites_comp_rtg_d_png);
		type.set ("assets/images/component/buttonsprites/comp_rtg_d.png", AssetType.IMAGE);
		
		className.set ("assets/images/component/buttonsprites/comp_swap_alt.png", __ASSET__assets_images_component_buttonsprites_comp_swap_alt_png);
		type.set ("assets/images/component/buttonsprites/comp_swap_alt.png", AssetType.IMAGE);
		
		className.set ("assets/images/component/buttonsprites/comp_swap_d.png", __ASSET__assets_images_component_buttonsprites_comp_swap_d_png);
		type.set ("assets/images/component/buttonsprites/comp_swap_d.png", AssetType.IMAGE);
		
		className.set ("assets/images/component/buttonsprites/template.pdn", __ASSET__assets_images_component_buttonsprites_template_pdn);
		type.set ("assets/images/component/buttonsprites/template.pdn", AssetType.TEXT);
		
		className.set ("assets/images/component/comp_alice.png", __ASSET__assets_images_component_comp_alice_png);
		type.set ("assets/images/component/comp_alice.png", AssetType.IMAGE);
		
		className.set ("assets/images/component/comp_heatshield.png", __ASSET__assets_images_component_comp_heatshield_png);
		type.set ("assets/images/component/comp_heatshield.png", AssetType.IMAGE);
		
		className.set ("assets/images/component/comp_lorri.png", __ASSET__assets_images_component_comp_lorri_png);
		type.set ("assets/images/component/comp_lorri.png", AssetType.IMAGE);
		
		className.set ("assets/images/component/comp_pepssi.png", __ASSET__assets_images_component_comp_pepssi_png);
		type.set ("assets/images/component/comp_pepssi.png", AssetType.IMAGE);
		
		className.set ("assets/images/component/comp_ralph.png", __ASSET__assets_images_component_comp_ralph_png);
		type.set ("assets/images/component/comp_ralph.png", AssetType.IMAGE);
		
		className.set ("assets/images/component/comp_rex.png", __ASSET__assets_images_component_comp_rex_png);
		type.set ("assets/images/component/comp_rex.png", AssetType.IMAGE);
		
		className.set ("assets/images/component/comp_rtg.png", __ASSET__assets_images_component_comp_rtg_png);
		type.set ("assets/images/component/comp_rtg.png", AssetType.IMAGE);
		
		className.set ("assets/images/component/comp_swap.png", __ASSET__assets_images_component_comp_swap_png);
		type.set ("assets/images/component/comp_swap.png", AssetType.IMAGE);
		
		className.set ("assets/images/component/NH.png", __ASSET__assets_images_component_nh_png);
		type.set ("assets/images/component/NH.png", AssetType.IMAGE);
		
		className.set ("assets/images/component/nh_large.png", __ASSET__assets_images_component_nh_large_png);
		type.set ("assets/images/component/nh_large.png", AssetType.IMAGE);
		
		className.set ("assets/images/facts/fact0.png", __ASSET__assets_images_facts_fact0_png);
		type.set ("assets/images/facts/fact0.png", AssetType.IMAGE);
		
		className.set ("assets/images/facts/fact1.png", __ASSET__assets_images_facts_fact1_png);
		type.set ("assets/images/facts/fact1.png", AssetType.IMAGE);
		
		className.set ("assets/images/facts/fact2.png", __ASSET__assets_images_facts_fact2_png);
		type.set ("assets/images/facts/fact2.png", AssetType.IMAGE);
		
		className.set ("assets/images/facts/fact3.png", __ASSET__assets_images_facts_fact3_png);
		type.set ("assets/images/facts/fact3.png", AssetType.IMAGE);
		
		className.set ("assets/images/found/alice_button_backdrop.png", __ASSET__assets_images_found_alice_button_backdrop_png);
		type.set ("assets/images/found/alice_button_backdrop.png", AssetType.IMAGE);
		
		className.set ("assets/images/found/found_alice.png", __ASSET__assets_images_found_found_alice_png);
		type.set ("assets/images/found/found_alice.png", AssetType.IMAGE);
		
		className.set ("assets/images/found/found_alice_button.png", __ASSET__assets_images_found_found_alice_button_png);
		type.set ("assets/images/found/found_alice_button.png", AssetType.IMAGE);
		
		className.set ("assets/images/found/found_originals/alicefound.pdn", __ASSET__assets_images_found_found_originals_alicefound_pdn);
		type.set ("assets/images/found/found_originals/alicefound.pdn", AssetType.TEXT);
		
		className.set ("assets/images/found/found_originals/found-template.pdn", __ASSET__assets_images_found_found_originals_found_template_pdn);
		type.set ("assets/images/found/found_originals/found-template.pdn", AssetType.TEXT);
		
		className.set ("assets/images/found/found_originals/found_alice_button.pdn", __ASSET__assets_images_found_found_originals_found_alice_button_pdn);
		type.set ("assets/images/found/found_originals/found_alice_button.pdn", AssetType.TEXT);
		
		className.set ("assets/images/found/found_originals/rtg_found.pdn", __ASSET__assets_images_found_found_originals_rtg_found_pdn);
		type.set ("assets/images/found/found_originals/rtg_found.pdn", AssetType.TEXT);
		
		className.set ("assets/images/found/found_pepssi.png", __ASSET__assets_images_found_found_pepssi_png);
		type.set ("assets/images/found/found_pepssi.png", AssetType.IMAGE);
		
		className.set ("assets/images/found/found_pepssi_button.png", __ASSET__assets_images_found_found_pepssi_button_png);
		type.set ("assets/images/found/found_pepssi_button.png", AssetType.IMAGE);
		
		className.set ("assets/images/hub/alice_info.png", __ASSET__assets_images_hub_alice_info_png);
		type.set ("assets/images/hub/alice_info.png", AssetType.IMAGE);
		
		className.set ("assets/images/hub/blockout.png", __ASSET__assets_images_hub_blockout_png);
		type.set ("assets/images/hub/blockout.png", AssetType.IMAGE);
		
		className.set ("assets/images/hub/components_hero.png", __ASSET__assets_images_hub_components_hero_png);
		type.set ("assets/images/hub/components_hero.png", AssetType.IMAGE);
		
		className.set ("assets/images/hub/heat_info.png", __ASSET__assets_images_hub_heat_info_png);
		type.set ("assets/images/hub/heat_info.png", AssetType.IMAGE);
		
		className.set ("assets/images/hub/lorri_info.png", __ASSET__assets_images_hub_lorri_info_png);
		type.set ("assets/images/hub/lorri_info.png", AssetType.IMAGE);
		
		className.set ("assets/images/hub/pepssi_info.png", __ASSET__assets_images_hub_pepssi_info_png);
		type.set ("assets/images/hub/pepssi_info.png", AssetType.IMAGE);
		
		className.set ("assets/images/hub/ralph_info.png", __ASSET__assets_images_hub_ralph_info_png);
		type.set ("assets/images/hub/ralph_info.png", AssetType.IMAGE);
		
		className.set ("assets/images/hub/rex_info.png", __ASSET__assets_images_hub_rex_info_png);
		type.set ("assets/images/hub/rex_info.png", AssetType.IMAGE);
		
		className.set ("assets/images/hub/rtg_info.png", __ASSET__assets_images_hub_rtg_info_png);
		type.set ("assets/images/hub/rtg_info.png", AssetType.IMAGE);
		
		className.set ("assets/images/hub/swap_info.png", __ASSET__assets_images_hub_swap_info_png);
		type.set ("assets/images/hub/swap_info.png", AssetType.IMAGE);
		
		className.set ("assets/images/intro/beach.png", __ASSET__assets_images_intro_beach_png);
		type.set ("assets/images/intro/beach.png", AssetType.IMAGE);
		
		className.set ("assets/images/intro/name.png", __ASSET__assets_images_intro_name_png);
		type.set ("assets/images/intro/name.png", AssetType.IMAGE);
		
		className.set ("assets/images/intro/plane.png", __ASSET__assets_images_intro_plane_png);
		type.set ("assets/images/intro/plane.png", AssetType.IMAGE);
		
		className.set ("assets/images/intro/text0.png", __ASSET__assets_images_intro_text0_png);
		type.set ("assets/images/intro/text0.png", AssetType.IMAGE);
		
		className.set ("assets/images/intro/text1.png", __ASSET__assets_images_intro_text1_png);
		type.set ("assets/images/intro/text1.png", AssetType.IMAGE);
		
		className.set ("assets/images/intro/text2.png", __ASSET__assets_images_intro_text2_png);
		type.set ("assets/images/intro/text2.png", AssetType.IMAGE);
		
		className.set ("assets/images/intro/text3.png", __ASSET__assets_images_intro_text3_png);
		type.set ("assets/images/intro/text3.png", AssetType.IMAGE);
		
		className.set ("assets/images/intro/tower.png", __ASSET__assets_images_intro_tower_png);
		type.set ("assets/images/intro/tower.png", AssetType.IMAGE);
		
		className.set ("assets/images/intro/tutorial.png", __ASSET__assets_images_intro_tutorial_png);
		type.set ("assets/images/intro/tutorial.png", AssetType.IMAGE);
		
		className.set ("assets/images/intro/vab.png", __ASSET__assets_images_intro_vab_png);
		type.set ("assets/images/intro/vab.png", AssetType.IMAGE);
		
		className.set ("assets/images/launchblock/cloud0.png", __ASSET__assets_images_launchblock_cloud0_png);
		type.set ("assets/images/launchblock/cloud0.png", AssetType.IMAGE);
		
		className.set ("assets/images/launchblock/cloud1.png", __ASSET__assets_images_launchblock_cloud1_png);
		type.set ("assets/images/launchblock/cloud1.png", AssetType.IMAGE);
		
		className.set ("assets/images/launchblock/launch-thin-window.png", __ASSET__assets_images_launchblock_launch_thin_window_png);
		type.set ("assets/images/launchblock/launch-thin-window.png", AssetType.IMAGE);
		
		className.set ("assets/images/launchblock/launch-thin-window.png.meta", __ASSET__assets_images_launchblock_launch_thin_window_png_meta);
		type.set ("assets/images/launchblock/launch-thin-window.png.meta", AssetType.TEXT);
		
		className.set ("assets/images/launchblock/nh-atlas-v.pdn.meta", __ASSET__assets_images_launchblock_nh_atlas_v_pdn_meta);
		type.set ("assets/images/launchblock/nh-atlas-v.pdn.meta", AssetType.TEXT);
		
		className.set ("assets/images/launchblock/nh-launch-block.pdn.meta", __ASSET__assets_images_launchblock_nh_launch_block_pdn_meta);
		type.set ("assets/images/launchblock/nh-launch-block.pdn.meta", AssetType.TEXT);
		
		className.set ("assets/images/launchblock/nh-launch-block.png.meta", __ASSET__assets_images_launchblock_nh_launch_block_png_meta);
		type.set ("assets/images/launchblock/nh-launch-block.png.meta", AssetType.TEXT);
		
		className.set ("assets/images/launchblock/nh-launch-long - Copy.pdn.meta", __ASSET__assets_images_launchblock_nh_launch_long___copy_pdn_meta);
		type.set ("assets/images/launchblock/nh-launch-long - Copy.pdn.meta", AssetType.TEXT);
		
		className.set ("assets/images/launchblock/nh-launch-long-old.pdn.meta", __ASSET__assets_images_launchblock_nh_launch_long_old_pdn_meta);
		type.set ("assets/images/launchblock/nh-launch-long-old.pdn.meta", AssetType.TEXT);
		
		className.set ("assets/images/launchblock/nh-launch-long.pdn.meta", __ASSET__assets_images_launchblock_nh_launch_long_pdn_meta);
		type.set ("assets/images/launchblock/nh-launch-long.pdn.meta", AssetType.TEXT);
		
		className.set ("assets/images/launchblock/nh-launch-long.png.meta", __ASSET__assets_images_launchblock_nh_launch_long_png_meta);
		type.set ("assets/images/launchblock/nh-launch-long.png.meta", AssetType.TEXT);
		
		className.set ("assets/images/launchblock/nh-pastel.png.meta", __ASSET__assets_images_launchblock_nh_pastel_png_meta);
		type.set ("assets/images/launchblock/nh-pastel.png.meta", AssetType.TEXT);
		
		className.set ("assets/images/launchblock/nh-postcard - Copy - Copy.png.meta", __ASSET__assets_images_launchblock_nh_postcard___copy___copy_png_meta);
		type.set ("assets/images/launchblock/nh-postcard - Copy - Copy.png.meta", AssetType.TEXT);
		
		className.set ("assets/images/launchblock/nh-postcard - Copy.pdn.meta", __ASSET__assets_images_launchblock_nh_postcard___copy_pdn_meta);
		type.set ("assets/images/launchblock/nh-postcard - Copy.pdn.meta", AssetType.TEXT);
		
		className.set ("assets/images/launchblock/nh-postcard - Copy.png.meta", __ASSET__assets_images_launchblock_nh_postcard___copy_png_meta);
		type.set ("assets/images/launchblock/nh-postcard - Copy.png.meta", AssetType.TEXT);
		
		className.set ("assets/images/launchblock/nh-postcard-skeu.png.meta", __ASSET__assets_images_launchblock_nh_postcard_skeu_png_meta);
		type.set ("assets/images/launchblock/nh-postcard-skeu.png.meta", AssetType.TEXT);
		
		className.set ("assets/images/launchblock/nh-postcard.pdn.meta", __ASSET__assets_images_launchblock_nh_postcard_pdn_meta);
		type.set ("assets/images/launchblock/nh-postcard.pdn.meta", AssetType.TEXT);
		
		className.set ("assets/images/launchblock/nh-postcard.png.meta", __ASSET__assets_images_launchblock_nh_postcard_png_meta);
		type.set ("assets/images/launchblock/nh-postcard.png.meta", AssetType.TEXT);
		
		className.set ("assets/images/launchblock/pad-norocket.png", __ASSET__assets_images_launchblock_pad_norocket_png);
		type.set ("assets/images/launchblock/pad-norocket.png", AssetType.IMAGE);
		
		className.set ("assets/images/launchblock/pad-rocket.png", __ASSET__assets_images_launchblock_pad_rocket_png);
		type.set ("assets/images/launchblock/pad-rocket.png", AssetType.IMAGE);
		
		className.set ("assets/images/launchblock/skyback - Copy.png", __ASSET__assets_images_launchblock_skyback___copy_png);
		type.set ("assets/images/launchblock/skyback - Copy.png", AssetType.IMAGE);
		
		className.set ("assets/images/launchblock/skyback.png", __ASSET__assets_images_launchblock_skyback_png);
		type.set ("assets/images/launchblock/skyback.png", AssetType.IMAGE);
		
		className.set ("assets/images/logo.png", __ASSET__assets_images_logo_png);
		type.set ("assets/images/logo.png", AssetType.IMAGE);
		
		className.set ("assets/images/logoflicker.png", __ASSET__assets_images_logoflicker_png);
		type.set ("assets/images/logoflicker.png", AssetType.IMAGE);
		
		className.set ("assets/images/menu/button originals/buttontemplate - Copy.pdn", __ASSET__assets_images_menu_button_originals_buttontemplate___copy_pdn);
		type.set ("assets/images/menu/button originals/buttontemplate - Copy.pdn", AssetType.TEXT);
		
		className.set ("assets/images/menu/button originals/button_begin.pdn", __ASSET__assets_images_menu_button_originals_button_begin_pdn);
		type.set ("assets/images/menu/button originals/button_begin.pdn", AssetType.TEXT);
		
		className.set ("assets/images/menu/button originals/button_mute.pdn", __ASSET__assets_images_menu_button_originals_button_mute_pdn);
		type.set ("assets/images/menu/button originals/button_mute.pdn", AssetType.TEXT);
		
		className.set ("assets/images/menu/button originals/button_pad.pdn", __ASSET__assets_images_menu_button_originals_button_pad_pdn);
		type.set ("assets/images/menu/button originals/button_pad.pdn", AssetType.TEXT);
		
		className.set ("assets/images/menu/button originals/button_quit.pdn", __ASSET__assets_images_menu_button_originals_button_quit_pdn);
		type.set ("assets/images/menu/button originals/button_quit.pdn", AssetType.TEXT);
		
		className.set ("assets/images/menu/button originals/button_settings.pdn", __ASSET__assets_images_menu_button_originals_button_settings_pdn);
		type.set ("assets/images/menu/button originals/button_settings.pdn", AssetType.TEXT);
		
		className.set ("assets/images/menu/button originals/d_warning.pdn", __ASSET__assets_images_menu_button_originals_d_warning_pdn);
		type.set ("assets/images/menu/button originals/d_warning.pdn", AssetType.TEXT);
		
		className.set ("assets/images/menu/buttontemplate.pdn", __ASSET__assets_images_menu_buttontemplate_pdn);
		type.set ("assets/images/menu/buttontemplate.pdn", AssetType.TEXT);
		
		className.set ("assets/images/menu/button_about.png", __ASSET__assets_images_menu_button_about_png);
		type.set ("assets/images/menu/button_about.png", AssetType.IMAGE);
		
		className.set ("assets/images/menu/button_back.png", __ASSET__assets_images_menu_button_back_png);
		type.set ("assets/images/menu/button_back.png", AssetType.IMAGE);
		
		className.set ("assets/images/menu/button_begin.png", __ASSET__assets_images_menu_button_begin_png);
		type.set ("assets/images/menu/button_begin.png", AssetType.IMAGE);
		
		className.set ("assets/images/menu/button_debug.png", __ASSET__assets_images_menu_button_debug_png);
		type.set ("assets/images/menu/button_debug.png", AssetType.IMAGE);
		
		className.set ("assets/images/menu/button_f.png", __ASSET__assets_images_menu_button_f_png);
		type.set ("assets/images/menu/button_f.png", AssetType.IMAGE);
		
		className.set ("assets/images/menu/button_facts.png", __ASSET__assets_images_menu_button_facts_png);
		type.set ("assets/images/menu/button_facts.png", AssetType.IMAGE);
		
		className.set ("assets/images/menu/button_full.png", __ASSET__assets_images_menu_button_full_png);
		type.set ("assets/images/menu/button_full.png", AssetType.IMAGE);
		
		className.set ("assets/images/menu/button_pad.png", __ASSET__assets_images_menu_button_pad_png);
		type.set ("assets/images/menu/button_pad.png", AssetType.IMAGE);
		
		className.set ("assets/images/menu/button_pluto.png", __ASSET__assets_images_menu_button_pluto_png);
		type.set ("assets/images/menu/button_pluto.png", AssetType.IMAGE);
		
		className.set ("assets/images/menu/button_quit.png", __ASSET__assets_images_menu_button_quit_png);
		type.set ("assets/images/menu/button_quit.png", AssetType.IMAGE);
		
		className.set ("assets/images/menu/button_rand.png", __ASSET__assets_images_menu_button_rand_png);
		type.set ("assets/images/menu/button_rand.png", AssetType.IMAGE);
		
		className.set ("assets/images/menu/button_setting.png", __ASSET__assets_images_menu_button_setting_png);
		type.set ("assets/images/menu/button_setting.png", AssetType.IMAGE);
		
		className.set ("assets/images/menu/button_settings.png", __ASSET__assets_images_menu_button_settings_png);
		type.set ("assets/images/menu/button_settings.png", AssetType.IMAGE);
		
		className.set ("assets/images/menu/coordsblock.png", __ASSET__assets_images_menu_coordsblock_png);
		type.set ("assets/images/menu/coordsblock.png", AssetType.IMAGE);
		
		className.set ("assets/images/menu/d_warning.png", __ASSET__assets_images_menu_d_warning_png);
		type.set ("assets/images/menu/d_warning.png", AssetType.IMAGE);
		
		className.set ("assets/images/menu/d_warn_cancel.png", __ASSET__assets_images_menu_d_warn_cancel_png);
		type.set ("assets/images/menu/d_warn_cancel.png", AssetType.IMAGE);
		
		className.set ("assets/images/menu/d_warn_ok.pdn", __ASSET__assets_images_menu_d_warn_ok_pdn);
		type.set ("assets/images/menu/d_warn_ok.pdn", AssetType.TEXT);
		
		className.set ("assets/images/menu/d_warn_ok.png", __ASSET__assets_images_menu_d_warn_ok_png);
		type.set ("assets/images/menu/d_warn_ok.png", AssetType.IMAGE);
		
		className.set ("assets/images/menu/full_exit_notice.png", __ASSET__assets_images_menu_full_exit_notice_png);
		type.set ("assets/images/menu/full_exit_notice.png", AssetType.IMAGE);
		
		className.set ("assets/images/menu/moons/CharonOrbit.png", __ASSET__assets_images_menu_moons_charonorbit_png);
		type.set ("assets/images/menu/moons/CharonOrbit.png", AssetType.IMAGE);
		
		className.set ("assets/images/menu/moons/HydraOrbit.png", __ASSET__assets_images_menu_moons_hydraorbit_png);
		type.set ("assets/images/menu/moons/HydraOrbit.png", AssetType.IMAGE);
		
		className.set ("assets/images/menu/moons/KerberosOrbit.png", __ASSET__assets_images_menu_moons_kerberosorbit_png);
		type.set ("assets/images/menu/moons/KerberosOrbit.png", AssetType.IMAGE);
		
		className.set ("assets/images/menu/moons/NixOrbit.png", __ASSET__assets_images_menu_moons_nixorbit_png);
		type.set ("assets/images/menu/moons/NixOrbit.png", AssetType.IMAGE);
		
		className.set ("assets/images/menu/moons/original/Charon.png", __ASSET__assets_images_menu_moons_original_charon_png);
		type.set ("assets/images/menu/moons/original/Charon.png", AssetType.IMAGE);
		
		className.set ("assets/images/menu/moons/original/Hydra.png", __ASSET__assets_images_menu_moons_original_hydra_png);
		type.set ("assets/images/menu/moons/original/Hydra.png", AssetType.IMAGE);
		
		className.set ("assets/images/menu/moons/original/Kerberos.png", __ASSET__assets_images_menu_moons_original_kerberos_png);
		type.set ("assets/images/menu/moons/original/Kerberos.png", AssetType.IMAGE);
		
		className.set ("assets/images/menu/moons/original/Nix.png", __ASSET__assets_images_menu_moons_original_nix_png);
		type.set ("assets/images/menu/moons/original/Nix.png", AssetType.IMAGE);
		
		className.set ("assets/images/menu/moons/original/Styx.png", __ASSET__assets_images_menu_moons_original_styx_png);
		type.set ("assets/images/menu/moons/original/Styx.png", AssetType.IMAGE);
		
		className.set ("assets/images/menu/moons/Pluto.png", __ASSET__assets_images_menu_moons_pluto_png);
		type.set ("assets/images/menu/moons/Pluto.png", AssetType.IMAGE);
		
		className.set ("assets/images/menu/moons/StyxOrbit.png", __ASSET__assets_images_menu_moons_styxorbit_png);
		type.set ("assets/images/menu/moons/StyxOrbit.png", AssetType.IMAGE);
		
		className.set ("assets/images/menu/splash_x640.png", __ASSET__assets_images_menu_splash_x640_png);
		type.set ("assets/images/menu/splash_x640.png", AssetType.IMAGE);
		
		className.set ("assets/images/menu/starback.png", __ASSET__assets_images_menu_starback_png);
		type.set ("assets/images/menu/starback.png", AssetType.IMAGE);
		
		className.set ("assets/images/misc/320xp.pdn", __ASSET__assets_images_misc_320xp_pdn);
		type.set ("assets/images/misc/320xp.pdn", AssetType.TEXT);
		
		className.set ("assets/images/misc/320xp.png", __ASSET__assets_images_misc_320xp_png);
		type.set ("assets/images/misc/320xp.png", AssetType.IMAGE);
		
		className.set ("assets/images/misc/earth-32x.png", __ASSET__assets_images_misc_earth_32x_png);
		type.set ("assets/images/misc/earth-32x.png", AssetType.IMAGE);
		
		className.set ("assets/images/misc/pls.png", __ASSET__assets_images_misc_pls_png);
		type.set ("assets/images/misc/pls.png", AssetType.IMAGE);
		
		className.set ("assets/images/mute/Mute.png", __ASSET__assets_images_mute_mute_png);
		type.set ("assets/images/mute/Mute.png", AssetType.IMAGE);
		
		className.set ("assets/images/mute/MuteOn.png", __ASSET__assets_images_mute_muteon_png);
		type.set ("assets/images/mute/MuteOn.png", AssetType.IMAGE);
		
		className.set ("assets/images/NH.ico", __ASSET__assets_images_nh_ico);
		type.set ("assets/images/NH.ico", AssetType.BINARY);
		
		className.set ("assets/images/nh_large.svg", __ASSET__assets_images_nh_large_svg);
		type.set ("assets/images/nh_large.svg", AssetType.TEXT);
		
		className.set ("assets/images/pepssiwire/background.png", __ASSET__assets_images_pepssiwire_background_png);
		type.set ("assets/images/pepssiwire/background.png", AssetType.IMAGE);
		
		className.set ("assets/images/pepssiwire/bblue.png", __ASSET__assets_images_pepssiwire_bblue_png);
		type.set ("assets/images/pepssiwire/bblue.png", AssetType.IMAGE);
		
		className.set ("assets/images/pepssiwire/box - Copy.pdn", __ASSET__assets_images_pepssiwire_box___copy_pdn);
		type.set ("assets/images/pepssiwire/box - Copy.pdn", AssetType.TEXT);
		
		className.set ("assets/images/pepssiwire/box-mockup.pdn", __ASSET__assets_images_pepssiwire_box_mockup_pdn);
		type.set ("assets/images/pepssiwire/box-mockup.pdn", AssetType.TEXT);
		
		className.set ("assets/images/pepssiwire/box-mockup.png", __ASSET__assets_images_pepssiwire_box_mockup_png);
		type.set ("assets/images/pepssiwire/box-mockup.png", AssetType.IMAGE);
		
		className.set ("assets/images/pepssiwire/box.pdn", __ASSET__assets_images_pepssiwire_box_pdn);
		type.set ("assets/images/pepssiwire/box.pdn", AssetType.TEXT);
		
		className.set ("assets/images/pepssiwire/box.png", __ASSET__assets_images_pepssiwire_box_png);
		type.set ("assets/images/pepssiwire/box.png", AssetType.IMAGE);
		
		className.set ("assets/images/pepssiwire/bparcel.png", __ASSET__assets_images_pepssiwire_bparcel_png);
		type.set ("assets/images/pepssiwire/bparcel.png", AssetType.IMAGE);
		
		className.set ("assets/images/pepssiwire/bpeach.png", __ASSET__assets_images_pepssiwire_bpeach_png);
		type.set ("assets/images/pepssiwire/bpeach.png", AssetType.IMAGE);
		
		className.set ("assets/images/pepssiwire/bpink.png", __ASSET__assets_images_pepssiwire_bpink_png);
		type.set ("assets/images/pepssiwire/bpink.png", AssetType.IMAGE);
		
		className.set ("assets/images/pepssiwire/colors.png", __ASSET__assets_images_pepssiwire_colors_png);
		type.set ("assets/images/pepssiwire/colors.png", AssetType.IMAGE);
		
		className.set ("assets/images/pepssiwire/dialogback.png", __ASSET__assets_images_pepssiwire_dialogback_png);
		type.set ("assets/images/pepssiwire/dialogback.png", AssetType.IMAGE);
		
		className.set ("assets/images/pepssiwire/dialogtext.png", __ASSET__assets_images_pepssiwire_dialogtext_png);
		type.set ("assets/images/pepssiwire/dialogtext.png", AssetType.IMAGE);
		
		className.set ("assets/images/pepssiwire/old/0bluealt.png", __ASSET__assets_images_pepssiwire_old_0bluealt_png);
		type.set ("assets/images/pepssiwire/old/0bluealt.png", AssetType.IMAGE);
		
		className.set ("assets/images/pepssiwire/old/0limealt.png", __ASSET__assets_images_pepssiwire_old_0limealt_png);
		type.set ("assets/images/pepssiwire/old/0limealt.png", AssetType.IMAGE);
		
		className.set ("assets/images/pepssiwire/old/0peachalt.png", __ASSET__assets_images_pepssiwire_old_0peachalt_png);
		type.set ("assets/images/pepssiwire/old/0peachalt.png", AssetType.IMAGE);
		
		className.set ("assets/images/pepssiwire/old/0pinkalt.png", __ASSET__assets_images_pepssiwire_old_0pinkalt_png);
		type.set ("assets/images/pepssiwire/old/0pinkalt.png", AssetType.IMAGE);
		
		className.set ("assets/images/pepssiwire/old/1bluealt.png", __ASSET__assets_images_pepssiwire_old_1bluealt_png);
		type.set ("assets/images/pepssiwire/old/1bluealt.png", AssetType.IMAGE);
		
		className.set ("assets/images/pepssiwire/old/1limealt.png", __ASSET__assets_images_pepssiwire_old_1limealt_png);
		type.set ("assets/images/pepssiwire/old/1limealt.png", AssetType.IMAGE);
		
		className.set ("assets/images/pepssiwire/old/1peachalt.png", __ASSET__assets_images_pepssiwire_old_1peachalt_png);
		type.set ("assets/images/pepssiwire/old/1peachalt.png", AssetType.IMAGE);
		
		className.set ("assets/images/pepssiwire/old/1pinkalt.png", __ASSET__assets_images_pepssiwire_old_1pinkalt_png);
		type.set ("assets/images/pepssiwire/old/1pinkalt.png", AssetType.IMAGE);
		
		className.set ("assets/images/pepssiwire/original/0blue.png", __ASSET__assets_images_pepssiwire_original_0blue_png);
		type.set ("assets/images/pepssiwire/original/0blue.png", AssetType.IMAGE);
		
		className.set ("assets/images/pepssiwire/original/0lime.png", __ASSET__assets_images_pepssiwire_original_0lime_png);
		type.set ("assets/images/pepssiwire/original/0lime.png", AssetType.IMAGE);
		
		className.set ("assets/images/pepssiwire/original/0peach.png", __ASSET__assets_images_pepssiwire_original_0peach_png);
		type.set ("assets/images/pepssiwire/original/0peach.png", AssetType.IMAGE);
		
		className.set ("assets/images/pepssiwire/original/0pink.png", __ASSET__assets_images_pepssiwire_original_0pink_png);
		type.set ("assets/images/pepssiwire/original/0pink.png", AssetType.IMAGE);
		
		className.set ("assets/images/pepssiwire/parcel.pdn", __ASSET__assets_images_pepssiwire_parcel_pdn);
		type.set ("assets/images/pepssiwire/parcel.pdn", AssetType.TEXT);
		
		className.set ("assets/images/pepssiwire/parcel.png", __ASSET__assets_images_pepssiwire_parcel_png);
		type.set ("assets/images/pepssiwire/parcel.png", AssetType.IMAGE);
		
		className.set ("assets/images/pepssiwire/sgsgsg.pdn", __ASSET__assets_images_pepssiwire_sgsgsg_pdn);
		type.set ("assets/images/pepssiwire/sgsgsg.pdn", AssetType.TEXT);
		
		className.set ("assets/images/pepssiwire/Untitled.pdn", __ASSET__assets_images_pepssiwire_untitled_pdn);
		type.set ("assets/images/pepssiwire/Untitled.pdn", AssetType.TEXT);
		
		className.set ("assets/images/pepssiwire/Untitled.png", __ASSET__assets_images_pepssiwire_untitled_png);
		type.set ("assets/images/pepssiwire/Untitled.png", AssetType.IMAGE);
		
		className.set ("assets/images/reference.txt", __ASSET__assets_images_reference_txt);
		type.set ("assets/images/reference.txt", AssetType.TEXT);
		
		className.set ("assets/images/rtgrun/background.pdn", __ASSET__assets_images_rtgrun_background_pdn);
		type.set ("assets/images/rtgrun/background.pdn", AssetType.TEXT);
		
		className.set ("assets/images/rtgrun/background.png", __ASSET__assets_images_rtgrun_background_png);
		type.set ("assets/images/rtgrun/background.png", AssetType.IMAGE);
		
		className.set ("assets/images/rtgrun/clouds.png", __ASSET__assets_images_rtgrun_clouds_png);
		type.set ("assets/images/rtgrun/clouds.png", AssetType.IMAGE);
		
		className.set ("assets/images/rtgrun/mockup.pdn", __ASSET__assets_images_rtgrun_mockup_pdn);
		type.set ("assets/images/rtgrun/mockup.pdn", AssetType.TEXT);
		
		className.set ("assets/images/rtgrun/placeholder.pdn", __ASSET__assets_images_rtgrun_placeholder_pdn);
		type.set ("assets/images/rtgrun/placeholder.pdn", AssetType.TEXT);
		
		className.set ("assets/images/rtgrun/placeholder.png", __ASSET__assets_images_rtgrun_placeholder_png);
		type.set ("assets/images/rtgrun/placeholder.png", AssetType.IMAGE);
		
		className.set ("assets/images/rtgrun/sky.png", __ASSET__assets_images_rtgrun_sky_png);
		type.set ("assets/images/rtgrun/sky.png", AssetType.IMAGE);
		
		className.set ("assets/images/settings/button_fullscreen.png", __ASSET__assets_images_settings_button_fullscreen_png);
		type.set ("assets/images/settings/button_fullscreen.png", AssetType.IMAGE);
		
		className.set ("assets/images/settings/button_fullscreen_alt.png", __ASSET__assets_images_settings_button_fullscreen_alt_png);
		type.set ("assets/images/settings/button_fullscreen_alt.png", AssetType.IMAGE);
		
		className.set ("assets/images/settings/button_sound.png", __ASSET__assets_images_settings_button_sound_png);
		type.set ("assets/images/settings/button_sound.png", AssetType.IMAGE);
		
		className.set ("assets/images/settings/button_sound_alt.png", __ASSET__assets_images_settings_button_sound_alt_png);
		type.set ("assets/images/settings/button_sound_alt.png", AssetType.IMAGE);
		
		className.set ("assets/images/settings/originals/button_fullscreen.pdn", __ASSET__assets_images_settings_originals_button_fullscreen_pdn);
		type.set ("assets/images/settings/originals/button_fullscreen.pdn", AssetType.TEXT);
		
		className.set ("assets/images/settings/originals/button_sound.pdn", __ASSET__assets_images_settings_originals_button_sound_pdn);
		type.set ("assets/images/settings/originals/button_sound.pdn", AssetType.TEXT);
		
		className.set ("assets/images/settings/title_settings.png", __ASSET__assets_images_settings_title_settings_png);
		type.set ("assets/images/settings/title_settings.png", AssetType.IMAGE);
		
		className.set ("assets/music/menu-main2.wav", __ASSET__assets_music_menu_main2_wav);
		type.set ("assets/music/menu-main2.wav", AssetType.SOUND);
		
		className.set ("assets/music/music_credits.txt", __ASSET__assets_music_music_credits_txt);
		type.set ("assets/music/music_credits.txt", AssetType.TEXT);
		
		className.set ("assets/sounds/data.wav", __ASSET__assets_sounds_data_wav);
		type.set ("assets/sounds/data.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/error.wav", __ASSET__assets_sounds_error_wav);
		type.set ("assets/sounds/error.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/get.wav", __ASSET__assets_sounds_get_wav);
		type.set ("assets/sounds/get.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/introtone.mp3", __ASSET__assets_sounds_introtone_mp3);
		type.set ("assets/sounds/introtone.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/introtone.wav", __ASSET__assets_sounds_introtone_wav);
		type.set ("assets/sounds/introtone.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/Pickup_Coin.wav", __ASSET__assets_sounds_pickup_coin_wav);
		type.set ("assets/sounds/Pickup_Coin.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/select.wav", __ASSET__assets_sounds_select_wav);
		type.set ("assets/sounds/select.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/signal.wav", __ASSET__assets_sounds_signal_wav);
		type.set ("assets/sounds/signal.wav", AssetType.SOUND);
		useManifest = true;
		useManifest = true;
		
		className.set ("assets/fonts/nokiafc22.ttf", __ASSET__assets_fonts_nokiafc22_ttf);
		type.set ("assets/fonts/nokiafc22.ttf", AssetType.FONT);
		
		className.set ("assets/fonts/arial.ttf", __ASSET__assets_fonts_arial_ttf);
		type.set ("assets/fonts/arial.ttf", AssetType.FONT);
		
		
		if (useManifest) {
			
			loadManifest ();
			
			if (Sys.args ().indexOf ("-livereload") > -1) {
				
				var path = FileSystem.fullPath ("manifest");
				lastModified = FileSystem.stat (path).mtime.getTime ();
				
				timer = new Timer (2000);
				timer.run = function () {
					
					var modified = FileSystem.stat (path).mtime.getTime ();
					
					if (modified > lastModified) {
						
						lastModified = modified;
						loadManifest ();
						
						onChange.dispatch ();
						
					}
					
				}
				
			}
			
		}
		
		#else
		
		loadManifest ();
		
		#end
		#end
		
	}
	
	
	public override function exists (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var assetType = this.type.get (id);
		
		if (assetType != null) {
			
			if (assetType == requestedType || ((requestedType == SOUND || requestedType == MUSIC) && (assetType == MUSIC || assetType == SOUND))) {
				
				return true;
				
			}
			
			#if flash
			
			if (requestedType == BINARY && (assetType == BINARY || assetType == TEXT || assetType == IMAGE)) {
				
				return true;
				
			} else if (requestedType == null || path.exists (id)) {
				
				return true;
				
			}
			
			#else
			
			if (requestedType == BINARY || requestedType == null || (assetType == BINARY && requestedType == TEXT)) {
				
				return true;
				
			}
			
			#end
			
		}
		
		return false;
		
	}
	
	
	public override function getAudioBuffer (id:String):AudioBuffer {
		
		#if flash
		
		var buffer = new AudioBuffer ();
		buffer.src = cast (Type.createInstance (className.get (id), []), Sound);
		return buffer;
		
		#elseif html5
		
		return null;
		//return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		if (className.exists(id)) return AudioBuffer.fromBytes (cast (Type.createInstance (className.get (id), []), ByteArray));
		else return AudioBuffer.fromFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getBytes (id:String):ByteArray {
		
		#if flash
		
		switch (type.get (id)) {
			
			case TEXT, BINARY:
				
				return cast (Type.createInstance (className.get (id), []), ByteArray);
			
			case IMAGE:
				
				var bitmapData = cast (Type.createInstance (className.get (id), []), BitmapData);
				return bitmapData.getPixels (bitmapData.rect);
			
			default:
				
				return null;
			
		}
		
		return cast (Type.createInstance (className.get (id), []), ByteArray);
		
		#elseif html5
		
		var bytes:ByteArray = null;
		var loader = Preloader.loaders.get (path.get (id));
		
		if (loader == null) {
			
			return null;
			
		}
		
		var data = loader.data;
		
		if (Std.is (data, String)) {
			
			bytes = new ByteArray ();
			bytes.writeUTFBytes (data);
			
		} else if (Std.is (data, ByteArray)) {
			
			bytes = cast data;
			
		} else {
			
			bytes = null;
			
		}
		
		if (bytes != null) {
			
			bytes.position = 0;
			return bytes;
			
		} else {
			
			return null;
		}
		
		#else
		
		if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), ByteArray);
		else return ByteArray.readFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getFont (id:String):Font {
		
		#if flash
		
		var src = Type.createInstance (className.get (id), []);
		
		var font = new Font (src.fontName);
		font.src = src;
		return font;
		
		#elseif html5
		
		return cast (Type.createInstance (className.get (id), []), Font);
		
		#else
		
		if (className.exists (id)) {
			
			var fontClass = className.get (id);
			return cast (Type.createInstance (fontClass, []), Font);
			
		} else {
			
			return Font.fromFile (path.get (id));
			
		}
		
		#end
		
	}
	
	
	public override function getImage (id:String):Image {
		
		#if flash
		
		return Image.fromBitmapData (cast (Type.createInstance (className.get (id), []), BitmapData));
		
		#elseif html5
		
		return Image.fromImageElement (Preloader.images.get (path.get (id)));
		
		#else
		
		if (className.exists (id)) {
			
			var fontClass = className.get (id);
			return cast (Type.createInstance (fontClass, []), Image);
			
		} else {
			
			return Image.fromFile (path.get (id));
			
		}
		
		#end
		
	}
	
	
	/*public override function getMusic (id:String):Dynamic {
		
		#if flash
		
		return cast (Type.createInstance (className.get (id), []), Sound);
		
		#elseif openfl_html5
		
		//var sound = new Sound ();
		//sound.__buffer = true;
		//sound.load (new URLRequest (path.get (id)));
		//return sound;
		return null;
		
		#elseif html5
		
		return null;
		//return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		return null;
		//if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Sound);
		//else return new Sound (new URLRequest (path.get (id)), null, true);
		
		#end
		
	}*/
	
	
	public override function getPath (id:String):String {
		
		//#if ios
		
		//return SystemPath.applicationDirectory + "/assets/" + path.get (id);
		
		//#else
		
		return path.get (id);
		
		//#end
		
	}
	
	
	public override function getText (id:String):String {
		
		#if html5
		
		var bytes:ByteArray = null;
		var loader = Preloader.loaders.get (path.get (id));
		
		if (loader == null) {
			
			return null;
			
		}
		
		var data = loader.data;
		
		if (Std.is (data, String)) {
			
			return cast data;
			
		} else if (Std.is (data, ByteArray)) {
			
			bytes = cast data;
			
		} else {
			
			bytes = null;
			
		}
		
		if (bytes != null) {
			
			bytes.position = 0;
			return bytes.readUTFBytes (bytes.length);
			
		} else {
			
			return null;
		}
		
		#else
		
		var bytes = getBytes (id);
		
		if (bytes == null) {
			
			return null;
			
		} else {
			
			return bytes.readUTFBytes (bytes.length);
			
		}
		
		#end
		
	}
	
	
	public override function isLocal (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		
		#if flash
		
		//if (requestedType != AssetType.MUSIC && requestedType != AssetType.SOUND) {
			
			return className.exists (id);
			
		//}
		
		#end
		
		return true;
		
	}
	
	
	public override function list (type:String):Array<String> {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var items = [];
		
		for (id in this.type.keys ()) {
			
			if (requestedType == null || exists (id, type)) {
				
				items.push (id);
				
			}
			
		}
		
		return items;
		
	}
	
	
	public override function loadAudioBuffer (id:String):Future<AudioBuffer> {
		
		var promise = new Promise<AudioBuffer> ();
		
		#if (flash)
		
		if (path.exists (id)) {
			
			var soundLoader = new Sound ();
			soundLoader.addEventListener (Event.COMPLETE, function (event) {
				
				var audioBuffer:AudioBuffer = new AudioBuffer();
				audioBuffer.src = event.currentTarget;
				promise.complete (audioBuffer);
				
			});
			soundLoader.addEventListener (ProgressEvent.PROGRESS, function (event) {
				
				if (event.bytesTotal == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (event.bytesLoaded / event.bytesTotal);
					
				}
				
			});
			soundLoader.addEventListener (IOErrorEvent.IO_ERROR, promise.error);
			soundLoader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getAudioBuffer (id));
			
		}
		
		#else
		
		promise.completeWith (new Future<AudioBuffer> (function () return getAudioBuffer (id)));
		
		#end
		
		return promise.future;
		
	}
	
	
	public override function loadBytes (id:String):Future<ByteArray> {
		
		var promise = new Promise<ByteArray> ();
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bytes = new ByteArray ();
				bytes.writeUTFBytes (event.currentTarget.data);
				bytes.position = 0;
				
				promise.complete (bytes);
				
			});
			loader.addEventListener (ProgressEvent.PROGRESS, function (event) {
				
				if (event.bytesTotal == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (event.bytesLoaded / event.bytesTotal);
					
				}
				
			});
			loader.addEventListener (IOErrorEvent.IO_ERROR, promise.error);
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getBytes (id));
			
		}
		
		#elseif html5
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.dataFormat = BINARY;
			loader.onComplete.add (function (_):Void {
				
				promise.complete (loader.data);
				
			});
			loader.onProgress.add (function (_, loaded, total) {
				
				if (total == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (loaded / total);
					
				}
				
			});
			loader.onIOError.add (function (_, e) {
				
				promise.error (e);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getBytes (id));
			
		}
		
		#else
		
		promise.completeWith (new Future<ByteArray> (function () return getBytes (id)));
		
		#end
		
		return promise.future;
		
	}
	
	
	public override function loadImage (id:String):Future<Image> {
		
		var promise = new Promise<Image> ();
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bitmapData = cast (event.currentTarget.content, Bitmap).bitmapData;
				promise.complete (Image.fromBitmapData (bitmapData));
				
			});
			loader.contentLoaderInfo.addEventListener (ProgressEvent.PROGRESS, function (event) {
				
				if (event.bytesTotal == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (event.bytesLoaded / event.bytesTotal);
					
				}
				
			});
			loader.contentLoaderInfo.addEventListener (IOErrorEvent.IO_ERROR, promise.error);
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getImage (id));
			
		}
		
		#elseif html5
		
		if (path.exists (id)) {
			
			var image = new js.html.Image ();
			image.onload = function (_):Void {
				
				promise.complete (Image.fromImageElement (image));
				
			}
			image.onerror = promise.error;
			image.src = path.get (id);
			
		} else {
			
			promise.complete (getImage (id));
			
		}
		
		#else
		
		promise.completeWith (new Future<Image> (function () return getImage (id)));
		
		#end
		
		return promise.future;
		
	}
	
	
	#if (!flash && !html5)
	private function loadManifest ():Void {
		
		try {
			
			#if blackberry
			var bytes = ByteArray.readFile ("app/native/manifest");
			#elseif tizen
			var bytes = ByteArray.readFile ("../res/manifest");
			#elseif emscripten
			var bytes = ByteArray.readFile ("assets/manifest");
			#elseif (mac && java)
			var bytes = ByteArray.readFile ("../Resources/manifest");
			#elseif ios
			var bytes = ByteArray.readFile ("assets/manifest");
			#else
			var bytes = ByteArray.readFile ("manifest");
			#end
			
			if (bytes != null) {
				
				bytes.position = 0;
				
				if (bytes.length > 0) {
					
					var data = bytes.readUTFBytes (bytes.length);
					
					if (data != null && data.length > 0) {
						
						var manifest:Array<Dynamic> = Unserializer.run (data);
						
						for (asset in manifest) {
							
							if (!className.exists (asset.id)) {
								
								#if ios
								path.set (asset.id, "assets/" + asset.path);
								#else
								path.set (asset.id, asset.path);
								#end
								type.set (asset.id, cast (asset.type, AssetType));
								
							}
							
						}
						
					}
					
				}
				
			} else {
				
				trace ("Warning: Could not load asset manifest (bytes was null)");
				
			}
		
		} catch (e:Dynamic) {
			
			trace ('Warning: Could not load asset manifest (${e})');
			
		}
		
	}
	#end
	
	
	public override function loadText (id:String):Future<String> {
		
		var promise = new Promise<String> ();
		
		#if html5
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.onComplete.add (function (_):Void {
				
				promise.complete (loader.data);
				
			});
			loader.onProgress.add (function (_, loaded, total) {
				
				if (total == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (loaded / total);
					
				}
				
			});
			loader.onIOError.add (function (_, msg) promise.error (msg));
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getText (id));
			
		}
		
		#else
		
		promise.completeWith (loadBytes (id).then (function (bytes) {
			
			return new Future<String> (function () {
				
				if (bytes == null) {
					
					return null;
					
				} else {
					
					return bytes.readUTFBytes (bytes.length);
					
				}
				
			});
			
		}));
		
		#end
		
		return promise.future;
		
	}
	
	
}


#if !display
#if flash

@:keep @:bind #if display private #end class __ASSET__assets_data_alicemap_oep extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_data_maze_oel extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_data_plats_oel extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_data_rtgmap_oep extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_fonts_oratorstd_otf extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_images__originals_bt_orig_comp_alice_alt_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images__originals_bt_orig_comp_alice_hover_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images__originals_bt_orig_comp_lorri_alt_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images__originals_bt_orig_comp_lorri_hover_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images__originals_bt_orig_comp_pepssi_alt_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images__originals_bt_orig_comp_pepssi_hover_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images__originals_bt_orig_comp_ralph_alt_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images__originals_bt_orig_comp_ralph_hover_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images__originals_intro_originals_beach_pdn extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_images__originals_intro_originals_untitled_pdn extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_images__originals_intro_originals_vab_pdn extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_images__originals_launchblock_other_nh_atlas_v_pdn extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_images__originals_launchblock_other_nh_launch_block_atlas_v_551_with_new_horizons_on_launch_pad_41_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images__originals_launchblock_other_nh_launch_block_nh_static_atlasv_launch_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images__originals_launchblock_other_nh_launch_block_pdn extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_images__originals_launchblock_other_nh_launch_block_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images__originals_launchblock_other_nh_launch_long___copy_pdn extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_images__originals_launchblock_other_nh_launch_long_old_pdn extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_images__originals_launchblock_other_nh_launch_long_pdn extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_images__originals_launchblock_other_nh_launch_long_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images__originals_launchblock_other_nh_pastel_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images__originals_launchblock_other_nh_postcard___copy_pdn extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_images__originals_launchblock_other_nh_postcard___copy_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images__originals_launchblock_other_nh_postcard_pdn extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_images__originals_launchblock_other_nh_postcard_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images__originals_launchblock_other_pad_norocket_pdn extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_images__originals_launchblock_other_pad_rocket_pdn extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_images__originals_splash_splash_x640_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images__originals_splash_startup_splash_hero___copy_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images__originals_splash_startup_splash_hero_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images__originals_stemlogo_pdn extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_images_about_stemlogo_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_about_title_about_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_alicemaze_alice_hit_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_alicemaze_b_bottom_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_alicemaze_b_full_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_alicemaze_b_hori_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_alicemaze_b_island_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_alicemaze_b_lb_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_alicemaze_b_left_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_alicemaze_b_map_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_alicemaze_b_rb_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_alicemaze_b_right_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_alicemaze_b_top_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_alicemaze_b_ul_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_alicemaze_b_ur_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_alicemaze_b_vert_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_alicemaze_cleaner_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_alicemaze_dialogue_alice_dialogue_back_pdn extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_images_alicemaze_dialogue_alice_dialogue_back_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_alicemaze_dialogue_oldmannormal_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_alicemaze_dialogue_speak0_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_alicemaze_dialogue_speak_0_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_alicemaze_dialogue_speak_template_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_alicemaze_dialogue_tag_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_alicemaze_dialogue_wasd_wasd_a_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_alicemaze_dialogue_wasd_wasd_d_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_alicemaze_dialogue_wasd_wasd_finger_pdn extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_images_alicemaze_dialogue_wasd_wasd_s_pdn extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_images_alicemaze_dialogue_wasd_wasd_s_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_alicemaze_dialogue_wasd_wasd_template_pdn extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_images_alicemaze_dialogue_wasd_wasd_w_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_alicemaze_dialogue_wasd_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_alicemaze_player_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_component_buttonsprites_comp_alice_alt_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_component_buttonsprites_comp_alice_d_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_component_buttonsprites_comp_heat_alt_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_component_buttonsprites_comp_heat_d_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_component_buttonsprites_comp_lorri_alt_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_component_buttonsprites_comp_lorri_d_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_component_buttonsprites_comp_pepssi_alt_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_component_buttonsprites_comp_pepssi_d_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_component_buttonsprites_comp_ralph_alt_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_component_buttonsprites_comp_ralph_d_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_component_buttonsprites_comp_rex_alt_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_component_buttonsprites_comp_rex_d_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_component_buttonsprites_comp_rtg_alt_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_component_buttonsprites_comp_rtg_d_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_component_buttonsprites_comp_swap_alt_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_component_buttonsprites_comp_swap_d_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_component_buttonsprites_template_pdn extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_images_component_comp_alice_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_component_comp_heatshield_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_component_comp_lorri_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_component_comp_pepssi_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_component_comp_ralph_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_component_comp_rex_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_component_comp_rtg_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_component_comp_swap_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_component_nh_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_component_nh_large_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_facts_fact0_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_facts_fact1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_facts_fact2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_facts_fact3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_found_alice_button_backdrop_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_found_found_alice_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_found_found_alice_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_found_found_originals_alicefound_pdn extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_images_found_found_originals_found_template_pdn extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_images_found_found_originals_found_alice_button_pdn extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_images_found_found_originals_rtg_found_pdn extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_images_found_found_pepssi_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_found_found_pepssi_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_hub_alice_info_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_hub_blockout_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_hub_components_hero_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_hub_heat_info_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_hub_lorri_info_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_hub_pepssi_info_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_hub_ralph_info_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_hub_rex_info_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_hub_rtg_info_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_hub_swap_info_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_intro_beach_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_intro_name_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_intro_plane_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_intro_text0_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_intro_text1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_intro_text2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_intro_text3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_intro_tower_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_intro_tutorial_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_intro_vab_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_launchblock_cloud0_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_launchblock_cloud1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_launchblock_launch_thin_window_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_launchblock_launch_thin_window_png_meta extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_images_launchblock_nh_atlas_v_pdn_meta extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_images_launchblock_nh_launch_block_pdn_meta extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_images_launchblock_nh_launch_block_png_meta extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_images_launchblock_nh_launch_long___copy_pdn_meta extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_images_launchblock_nh_launch_long_old_pdn_meta extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_images_launchblock_nh_launch_long_pdn_meta extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_images_launchblock_nh_launch_long_png_meta extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_images_launchblock_nh_pastel_png_meta extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_images_launchblock_nh_postcard___copy___copy_png_meta extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_images_launchblock_nh_postcard___copy_pdn_meta extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_images_launchblock_nh_postcard___copy_png_meta extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_images_launchblock_nh_postcard_skeu_png_meta extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_images_launchblock_nh_postcard_pdn_meta extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_images_launchblock_nh_postcard_png_meta extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_images_launchblock_pad_norocket_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_launchblock_pad_rocket_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_launchblock_skyback___copy_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_launchblock_skyback_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_logo_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_logoflicker_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_menu_button_originals_buttontemplate___copy_pdn extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_images_menu_button_originals_button_begin_pdn extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_images_menu_button_originals_button_mute_pdn extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_images_menu_button_originals_button_pad_pdn extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_images_menu_button_originals_button_quit_pdn extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_images_menu_button_originals_button_settings_pdn extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_images_menu_button_originals_d_warning_pdn extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_images_menu_buttontemplate_pdn extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_images_menu_button_about_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_menu_button_back_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_menu_button_begin_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_menu_button_debug_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_menu_button_f_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_menu_button_facts_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_menu_button_full_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_menu_button_pad_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_menu_button_pluto_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_menu_button_quit_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_menu_button_rand_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_menu_button_setting_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_menu_button_settings_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_menu_coordsblock_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_menu_d_warning_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_menu_d_warn_cancel_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_menu_d_warn_ok_pdn extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_images_menu_d_warn_ok_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_menu_full_exit_notice_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_menu_moons_charonorbit_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_menu_moons_hydraorbit_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_menu_moons_kerberosorbit_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_menu_moons_nixorbit_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_menu_moons_original_charon_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_menu_moons_original_hydra_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_menu_moons_original_kerberos_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_menu_moons_original_nix_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_menu_moons_original_styx_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_menu_moons_pluto_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_menu_moons_styxorbit_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_menu_splash_x640_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_menu_starback_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_misc_320xp_pdn extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_images_misc_320xp_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_misc_earth_32x_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_misc_pls_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_mute_mute_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_mute_muteon_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_nh_ico extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_images_nh_large_svg extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_images_pepssiwire_background_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_pepssiwire_bblue_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_pepssiwire_box___copy_pdn extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_images_pepssiwire_box_mockup_pdn extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_images_pepssiwire_box_mockup_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_pepssiwire_box_pdn extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_images_pepssiwire_box_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_pepssiwire_bparcel_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_pepssiwire_bpeach_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_pepssiwire_bpink_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_pepssiwire_colors_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_pepssiwire_dialogback_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_pepssiwire_dialogtext_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_pepssiwire_old_0bluealt_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_pepssiwire_old_0limealt_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_pepssiwire_old_0peachalt_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_pepssiwire_old_0pinkalt_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_pepssiwire_old_1bluealt_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_pepssiwire_old_1limealt_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_pepssiwire_old_1peachalt_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_pepssiwire_old_1pinkalt_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_pepssiwire_original_0blue_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_pepssiwire_original_0lime_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_pepssiwire_original_0peach_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_pepssiwire_original_0pink_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_pepssiwire_parcel_pdn extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_images_pepssiwire_parcel_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_pepssiwire_sgsgsg_pdn extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_images_pepssiwire_untitled_pdn extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_images_pepssiwire_untitled_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_reference_txt extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_images_rtgrun_background_pdn extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_images_rtgrun_background_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_rtgrun_clouds_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_rtgrun_mockup_pdn extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_images_rtgrun_placeholder_pdn extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_images_rtgrun_placeholder_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_rtgrun_sky_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_settings_button_fullscreen_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_settings_button_fullscreen_alt_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_settings_button_sound_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_settings_button_sound_alt_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_settings_originals_button_fullscreen_pdn extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_images_settings_originals_button_sound_pdn extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_images_settings_title_settings_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_music_menu_main2_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_music_music_credits_txt extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_data_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_error_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_get_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_introtone_mp3 extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_introtone_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_pickup_coin_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_select_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_signal_wav extends null { }


@:keep @:bind #if display private #end class __ASSET__assets_fonts_nokiafc22_ttf extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_fonts_arial_ttf extends null { }


#elseif html5





@:keep #if display private #end class __ASSET__assets_fonts_oratorstd_otf extends lime.text.Font { public function new () { super (); name = "Orator Std Medium"; } } 





























































































































































































































































@:keep #if display private #end class __ASSET__assets_fonts_nokiafc22_ttf extends lime.text.Font { public function new () { super (); name = "Nokia Cellphone FC Small"; } } 
@:keep #if display private #end class __ASSET__assets_fonts_arial_ttf extends lime.text.Font { public function new () { super (); name = "Arial"; } } 


#else



#if (windows || mac || linux || cpp)


@:file("assets/data/alicemap.oep") #if display private #end class __ASSET__assets_data_alicemap_oep extends lime.utils.ByteArray {}
@:file("assets/data/maze.oel") #if display private #end class __ASSET__assets_data_maze_oel extends lime.utils.ByteArray {}
@:file("assets/data/plats.oel") #if display private #end class __ASSET__assets_data_plats_oel extends lime.utils.ByteArray {}
@:file("assets/data/rtgmap.oep") #if display private #end class __ASSET__assets_data_rtgmap_oep extends lime.utils.ByteArray {}
@:font("assets/fonts/OratorStd.otf") #if display private #end class __ASSET__assets_fonts_oratorstd_otf extends lime.text.Font {}
@:image("assets/images/!originals/bt_orig/comp_alice_alt.png") #if display private #end class __ASSET__assets_images__originals_bt_orig_comp_alice_alt_png extends lime.graphics.Image {}
@:image("assets/images/!originals/bt_orig/comp_alice_hover.png") #if display private #end class __ASSET__assets_images__originals_bt_orig_comp_alice_hover_png extends lime.graphics.Image {}
@:image("assets/images/!originals/bt_orig/comp_lorri_alt.png") #if display private #end class __ASSET__assets_images__originals_bt_orig_comp_lorri_alt_png extends lime.graphics.Image {}
@:image("assets/images/!originals/bt_orig/comp_lorri_hover.png") #if display private #end class __ASSET__assets_images__originals_bt_orig_comp_lorri_hover_png extends lime.graphics.Image {}
@:image("assets/images/!originals/bt_orig/comp_pepssi_alt.png") #if display private #end class __ASSET__assets_images__originals_bt_orig_comp_pepssi_alt_png extends lime.graphics.Image {}
@:image("assets/images/!originals/bt_orig/comp_pepssi_hover.png") #if display private #end class __ASSET__assets_images__originals_bt_orig_comp_pepssi_hover_png extends lime.graphics.Image {}
@:image("assets/images/!originals/bt_orig/comp_ralph_alt.png") #if display private #end class __ASSET__assets_images__originals_bt_orig_comp_ralph_alt_png extends lime.graphics.Image {}
@:image("assets/images/!originals/bt_orig/comp_ralph_hover.png") #if display private #end class __ASSET__assets_images__originals_bt_orig_comp_ralph_hover_png extends lime.graphics.Image {}
@:file("assets/images/!originals/intro_originals/beach.pdn") #if display private #end class __ASSET__assets_images__originals_intro_originals_beach_pdn extends lime.utils.ByteArray {}
@:file("assets/images/!originals/intro_originals/Untitled.pdn") #if display private #end class __ASSET__assets_images__originals_intro_originals_untitled_pdn extends lime.utils.ByteArray {}
@:file("assets/images/!originals/intro_originals/vab.pdn") #if display private #end class __ASSET__assets_images__originals_intro_originals_vab_pdn extends lime.utils.ByteArray {}
@:file("assets/images/!originals/launchblock_other/nh-atlas-v.pdn") #if display private #end class __ASSET__assets_images__originals_launchblock_other_nh_atlas_v_pdn extends lime.utils.ByteArray {}
@:image("assets/images/!originals/launchblock_other/nh-launch-block/Atlas_V_551_with_New_Horizons_on_Launch_Pad_41.jpg") #if display private #end class __ASSET__assets_images__originals_launchblock_other_nh_launch_block_atlas_v_551_with_new_horizons_on_launch_pad_41_jpg extends lime.graphics.Image {}
@:image("assets/images/!originals/launchblock_other/nh-launch-block/nh-static-atlasv-launch.jpg") #if display private #end class __ASSET__assets_images__originals_launchblock_other_nh_launch_block_nh_static_atlasv_launch_jpg extends lime.graphics.Image {}
@:file("assets/images/!originals/launchblock_other/nh-launch-block.pdn") #if display private #end class __ASSET__assets_images__originals_launchblock_other_nh_launch_block_pdn extends lime.utils.ByteArray {}
@:image("assets/images/!originals/launchblock_other/nh-launch-block.png") #if display private #end class __ASSET__assets_images__originals_launchblock_other_nh_launch_block_png extends lime.graphics.Image {}
@:file("assets/images/!originals/launchblock_other/nh-launch-long - Copy.pdn") #if display private #end class __ASSET__assets_images__originals_launchblock_other_nh_launch_long___copy_pdn extends lime.utils.ByteArray {}
@:file("assets/images/!originals/launchblock_other/nh-launch-long-old.pdn") #if display private #end class __ASSET__assets_images__originals_launchblock_other_nh_launch_long_old_pdn extends lime.utils.ByteArray {}
@:file("assets/images/!originals/launchblock_other/nh-launch-long.pdn") #if display private #end class __ASSET__assets_images__originals_launchblock_other_nh_launch_long_pdn extends lime.utils.ByteArray {}
@:image("assets/images/!originals/launchblock_other/nh-launch-long.png") #if display private #end class __ASSET__assets_images__originals_launchblock_other_nh_launch_long_png extends lime.graphics.Image {}
@:image("assets/images/!originals/launchblock_other/nh-pastel.png") #if display private #end class __ASSET__assets_images__originals_launchblock_other_nh_pastel_png extends lime.graphics.Image {}
@:file("assets/images/!originals/launchblock_other/nh-postcard - Copy.pdn") #if display private #end class __ASSET__assets_images__originals_launchblock_other_nh_postcard___copy_pdn extends lime.utils.ByteArray {}
@:image("assets/images/!originals/launchblock_other/nh-postcard - Copy.png") #if display private #end class __ASSET__assets_images__originals_launchblock_other_nh_postcard___copy_png extends lime.graphics.Image {}
@:file("assets/images/!originals/launchblock_other/nh-postcard.pdn") #if display private #end class __ASSET__assets_images__originals_launchblock_other_nh_postcard_pdn extends lime.utils.ByteArray {}
@:image("assets/images/!originals/launchblock_other/nh-postcard.png") #if display private #end class __ASSET__assets_images__originals_launchblock_other_nh_postcard_png extends lime.graphics.Image {}
@:file("assets/images/!originals/launchblock_other/pad-norocket.pdn") #if display private #end class __ASSET__assets_images__originals_launchblock_other_pad_norocket_pdn extends lime.utils.ByteArray {}
@:file("assets/images/!originals/launchblock_other/pad-rocket.pdn") #if display private #end class __ASSET__assets_images__originals_launchblock_other_pad_rocket_pdn extends lime.utils.ByteArray {}
@:image("assets/images/!originals/splash/splash_x640.jpg") #if display private #end class __ASSET__assets_images__originals_splash_splash_x640_jpg extends lime.graphics.Image {}
@:image("assets/images/!originals/splash/startup-splash-hero - Copy.png") #if display private #end class __ASSET__assets_images__originals_splash_startup_splash_hero___copy_png extends lime.graphics.Image {}
@:image("assets/images/!originals/splash/startup-splash-hero.png") #if display private #end class __ASSET__assets_images__originals_splash_startup_splash_hero_png extends lime.graphics.Image {}
@:file("assets/images/!originals/stemlogo.pdn") #if display private #end class __ASSET__assets_images__originals_stemlogo_pdn extends lime.utils.ByteArray {}
@:image("assets/images/about/stemlogo.png") #if display private #end class __ASSET__assets_images_about_stemlogo_png extends lime.graphics.Image {}
@:image("assets/images/about/title_about.png") #if display private #end class __ASSET__assets_images_about_title_about_png extends lime.graphics.Image {}
@:image("assets/images/alicemaze/alice_hit.png") #if display private #end class __ASSET__assets_images_alicemaze_alice_hit_png extends lime.graphics.Image {}
@:image("assets/images/alicemaze/b-bottom.png") #if display private #end class __ASSET__assets_images_alicemaze_b_bottom_png extends lime.graphics.Image {}
@:image("assets/images/alicemaze/b-full.png") #if display private #end class __ASSET__assets_images_alicemaze_b_full_png extends lime.graphics.Image {}
@:image("assets/images/alicemaze/b-hori.png") #if display private #end class __ASSET__assets_images_alicemaze_b_hori_png extends lime.graphics.Image {}
@:image("assets/images/alicemaze/b-island.png") #if display private #end class __ASSET__assets_images_alicemaze_b_island_png extends lime.graphics.Image {}
@:image("assets/images/alicemaze/b-lb.png") #if display private #end class __ASSET__assets_images_alicemaze_b_lb_png extends lime.graphics.Image {}
@:image("assets/images/alicemaze/b-left.png") #if display private #end class __ASSET__assets_images_alicemaze_b_left_png extends lime.graphics.Image {}
@:image("assets/images/alicemaze/b-map.png") #if display private #end class __ASSET__assets_images_alicemaze_b_map_png extends lime.graphics.Image {}
@:image("assets/images/alicemaze/b-rb.png") #if display private #end class __ASSET__assets_images_alicemaze_b_rb_png extends lime.graphics.Image {}
@:image("assets/images/alicemaze/b-right.png") #if display private #end class __ASSET__assets_images_alicemaze_b_right_png extends lime.graphics.Image {}
@:image("assets/images/alicemaze/b-top.png") #if display private #end class __ASSET__assets_images_alicemaze_b_top_png extends lime.graphics.Image {}
@:image("assets/images/alicemaze/b-ul.png") #if display private #end class __ASSET__assets_images_alicemaze_b_ul_png extends lime.graphics.Image {}
@:image("assets/images/alicemaze/b-ur.png") #if display private #end class __ASSET__assets_images_alicemaze_b_ur_png extends lime.graphics.Image {}
@:image("assets/images/alicemaze/b-vert.png") #if display private #end class __ASSET__assets_images_alicemaze_b_vert_png extends lime.graphics.Image {}
@:image("assets/images/alicemaze/cleaner.png") #if display private #end class __ASSET__assets_images_alicemaze_cleaner_png extends lime.graphics.Image {}
@:file("assets/images/alicemaze/dialogue/alice_dialogue_back.pdn") #if display private #end class __ASSET__assets_images_alicemaze_dialogue_alice_dialogue_back_pdn extends lime.utils.ByteArray {}
@:image("assets/images/alicemaze/dialogue/alice_dialogue_back.png") #if display private #end class __ASSET__assets_images_alicemaze_dialogue_alice_dialogue_back_png extends lime.graphics.Image {}
@:image("assets/images/alicemaze/dialogue/OldManNormal.png") #if display private #end class __ASSET__assets_images_alicemaze_dialogue_oldmannormal_png extends lime.graphics.Image {}
@:image("assets/images/alicemaze/dialogue/speak0.png") #if display private #end class __ASSET__assets_images_alicemaze_dialogue_speak0_png extends lime.graphics.Image {}
@:image("assets/images/alicemaze/dialogue/speak_0.png") #if display private #end class __ASSET__assets_images_alicemaze_dialogue_speak_0_png extends lime.graphics.Image {}
@:image("assets/images/alicemaze/dialogue/speak_template.png") #if display private #end class __ASSET__assets_images_alicemaze_dialogue_speak_template_png extends lime.graphics.Image {}
@:image("assets/images/alicemaze/dialogue/tag.png") #if display private #end class __ASSET__assets_images_alicemaze_dialogue_tag_png extends lime.graphics.Image {}
@:image("assets/images/alicemaze/dialogue/wasd/wasd_a.png") #if display private #end class __ASSET__assets_images_alicemaze_dialogue_wasd_wasd_a_png extends lime.graphics.Image {}
@:image("assets/images/alicemaze/dialogue/wasd/wasd_d.png") #if display private #end class __ASSET__assets_images_alicemaze_dialogue_wasd_wasd_d_png extends lime.graphics.Image {}
@:file("assets/images/alicemaze/dialogue/wasd/wasd_finger.pdn") #if display private #end class __ASSET__assets_images_alicemaze_dialogue_wasd_wasd_finger_pdn extends lime.utils.ByteArray {}
@:file("assets/images/alicemaze/dialogue/wasd/wasd_s.pdn") #if display private #end class __ASSET__assets_images_alicemaze_dialogue_wasd_wasd_s_pdn extends lime.utils.ByteArray {}
@:image("assets/images/alicemaze/dialogue/wasd/wasd_s.png") #if display private #end class __ASSET__assets_images_alicemaze_dialogue_wasd_wasd_s_png extends lime.graphics.Image {}
@:file("assets/images/alicemaze/dialogue/wasd/wasd_template.pdn") #if display private #end class __ASSET__assets_images_alicemaze_dialogue_wasd_wasd_template_pdn extends lime.utils.ByteArray {}
@:image("assets/images/alicemaze/dialogue/wasd/wasd_w.png") #if display private #end class __ASSET__assets_images_alicemaze_dialogue_wasd_wasd_w_png extends lime.graphics.Image {}
@:image("assets/images/alicemaze/dialogue/wasd.png") #if display private #end class __ASSET__assets_images_alicemaze_dialogue_wasd_png extends lime.graphics.Image {}
@:image("assets/images/alicemaze/player.png") #if display private #end class __ASSET__assets_images_alicemaze_player_png extends lime.graphics.Image {}
@:image("assets/images/component/buttonsprites/comp_alice_alt.png") #if display private #end class __ASSET__assets_images_component_buttonsprites_comp_alice_alt_png extends lime.graphics.Image {}
@:image("assets/images/component/buttonsprites/comp_alice_d.png") #if display private #end class __ASSET__assets_images_component_buttonsprites_comp_alice_d_png extends lime.graphics.Image {}
@:image("assets/images/component/buttonsprites/comp_heat_alt.png") #if display private #end class __ASSET__assets_images_component_buttonsprites_comp_heat_alt_png extends lime.graphics.Image {}
@:image("assets/images/component/buttonsprites/comp_heat_d.png") #if display private #end class __ASSET__assets_images_component_buttonsprites_comp_heat_d_png extends lime.graphics.Image {}
@:image("assets/images/component/buttonsprites/comp_lorri_alt.png") #if display private #end class __ASSET__assets_images_component_buttonsprites_comp_lorri_alt_png extends lime.graphics.Image {}
@:image("assets/images/component/buttonsprites/comp_lorri_d.png") #if display private #end class __ASSET__assets_images_component_buttonsprites_comp_lorri_d_png extends lime.graphics.Image {}
@:image("assets/images/component/buttonsprites/comp_pepssi_alt.png") #if display private #end class __ASSET__assets_images_component_buttonsprites_comp_pepssi_alt_png extends lime.graphics.Image {}
@:image("assets/images/component/buttonsprites/comp_pepssi_d.png") #if display private #end class __ASSET__assets_images_component_buttonsprites_comp_pepssi_d_png extends lime.graphics.Image {}
@:image("assets/images/component/buttonsprites/comp_ralph_alt.png") #if display private #end class __ASSET__assets_images_component_buttonsprites_comp_ralph_alt_png extends lime.graphics.Image {}
@:image("assets/images/component/buttonsprites/comp_ralph_d.png") #if display private #end class __ASSET__assets_images_component_buttonsprites_comp_ralph_d_png extends lime.graphics.Image {}
@:image("assets/images/component/buttonsprites/comp_rex_alt.png") #if display private #end class __ASSET__assets_images_component_buttonsprites_comp_rex_alt_png extends lime.graphics.Image {}
@:image("assets/images/component/buttonsprites/comp_rex_d.png") #if display private #end class __ASSET__assets_images_component_buttonsprites_comp_rex_d_png extends lime.graphics.Image {}
@:image("assets/images/component/buttonsprites/comp_rtg_alt.png") #if display private #end class __ASSET__assets_images_component_buttonsprites_comp_rtg_alt_png extends lime.graphics.Image {}
@:image("assets/images/component/buttonsprites/comp_rtg_d.png") #if display private #end class __ASSET__assets_images_component_buttonsprites_comp_rtg_d_png extends lime.graphics.Image {}
@:image("assets/images/component/buttonsprites/comp_swap_alt.png") #if display private #end class __ASSET__assets_images_component_buttonsprites_comp_swap_alt_png extends lime.graphics.Image {}
@:image("assets/images/component/buttonsprites/comp_swap_d.png") #if display private #end class __ASSET__assets_images_component_buttonsprites_comp_swap_d_png extends lime.graphics.Image {}
@:file("assets/images/component/buttonsprites/template.pdn") #if display private #end class __ASSET__assets_images_component_buttonsprites_template_pdn extends lime.utils.ByteArray {}
@:image("assets/images/component/comp_alice.png") #if display private #end class __ASSET__assets_images_component_comp_alice_png extends lime.graphics.Image {}
@:image("assets/images/component/comp_heatshield.png") #if display private #end class __ASSET__assets_images_component_comp_heatshield_png extends lime.graphics.Image {}
@:image("assets/images/component/comp_lorri.png") #if display private #end class __ASSET__assets_images_component_comp_lorri_png extends lime.graphics.Image {}
@:image("assets/images/component/comp_pepssi.png") #if display private #end class __ASSET__assets_images_component_comp_pepssi_png extends lime.graphics.Image {}
@:image("assets/images/component/comp_ralph.png") #if display private #end class __ASSET__assets_images_component_comp_ralph_png extends lime.graphics.Image {}
@:image("assets/images/component/comp_rex.png") #if display private #end class __ASSET__assets_images_component_comp_rex_png extends lime.graphics.Image {}
@:image("assets/images/component/comp_rtg.png") #if display private #end class __ASSET__assets_images_component_comp_rtg_png extends lime.graphics.Image {}
@:image("assets/images/component/comp_swap.png") #if display private #end class __ASSET__assets_images_component_comp_swap_png extends lime.graphics.Image {}
@:image("assets/images/component/NH.png") #if display private #end class __ASSET__assets_images_component_nh_png extends lime.graphics.Image {}
@:image("assets/images/component/nh_large.png") #if display private #end class __ASSET__assets_images_component_nh_large_png extends lime.graphics.Image {}
@:image("assets/images/facts/fact0.png") #if display private #end class __ASSET__assets_images_facts_fact0_png extends lime.graphics.Image {}
@:image("assets/images/facts/fact1.png") #if display private #end class __ASSET__assets_images_facts_fact1_png extends lime.graphics.Image {}
@:image("assets/images/facts/fact2.png") #if display private #end class __ASSET__assets_images_facts_fact2_png extends lime.graphics.Image {}
@:image("assets/images/facts/fact3.png") #if display private #end class __ASSET__assets_images_facts_fact3_png extends lime.graphics.Image {}
@:image("assets/images/found/alice_button_backdrop.png") #if display private #end class __ASSET__assets_images_found_alice_button_backdrop_png extends lime.graphics.Image {}
@:image("assets/images/found/found_alice.png") #if display private #end class __ASSET__assets_images_found_found_alice_png extends lime.graphics.Image {}
@:image("assets/images/found/found_alice_button.png") #if display private #end class __ASSET__assets_images_found_found_alice_button_png extends lime.graphics.Image {}
@:file("assets/images/found/found_originals/alicefound.pdn") #if display private #end class __ASSET__assets_images_found_found_originals_alicefound_pdn extends lime.utils.ByteArray {}
@:file("assets/images/found/found_originals/found-template.pdn") #if display private #end class __ASSET__assets_images_found_found_originals_found_template_pdn extends lime.utils.ByteArray {}
@:file("assets/images/found/found_originals/found_alice_button.pdn") #if display private #end class __ASSET__assets_images_found_found_originals_found_alice_button_pdn extends lime.utils.ByteArray {}
@:file("assets/images/found/found_originals/rtg_found.pdn") #if display private #end class __ASSET__assets_images_found_found_originals_rtg_found_pdn extends lime.utils.ByteArray {}
@:image("assets/images/found/found_pepssi.png") #if display private #end class __ASSET__assets_images_found_found_pepssi_png extends lime.graphics.Image {}
@:image("assets/images/found/found_pepssi_button.png") #if display private #end class __ASSET__assets_images_found_found_pepssi_button_png extends lime.graphics.Image {}
@:image("assets/images/hub/alice_info.png") #if display private #end class __ASSET__assets_images_hub_alice_info_png extends lime.graphics.Image {}
@:image("assets/images/hub/blockout.png") #if display private #end class __ASSET__assets_images_hub_blockout_png extends lime.graphics.Image {}
@:image("assets/images/hub/components_hero.png") #if display private #end class __ASSET__assets_images_hub_components_hero_png extends lime.graphics.Image {}
@:image("assets/images/hub/heat_info.png") #if display private #end class __ASSET__assets_images_hub_heat_info_png extends lime.graphics.Image {}
@:image("assets/images/hub/lorri_info.png") #if display private #end class __ASSET__assets_images_hub_lorri_info_png extends lime.graphics.Image {}
@:image("assets/images/hub/pepssi_info.png") #if display private #end class __ASSET__assets_images_hub_pepssi_info_png extends lime.graphics.Image {}
@:image("assets/images/hub/ralph_info.png") #if display private #end class __ASSET__assets_images_hub_ralph_info_png extends lime.graphics.Image {}
@:image("assets/images/hub/rex_info.png") #if display private #end class __ASSET__assets_images_hub_rex_info_png extends lime.graphics.Image {}
@:image("assets/images/hub/rtg_info.png") #if display private #end class __ASSET__assets_images_hub_rtg_info_png extends lime.graphics.Image {}
@:image("assets/images/hub/swap_info.png") #if display private #end class __ASSET__assets_images_hub_swap_info_png extends lime.graphics.Image {}
@:image("assets/images/intro/beach.png") #if display private #end class __ASSET__assets_images_intro_beach_png extends lime.graphics.Image {}
@:image("assets/images/intro/name.png") #if display private #end class __ASSET__assets_images_intro_name_png extends lime.graphics.Image {}
@:image("assets/images/intro/plane.png") #if display private #end class __ASSET__assets_images_intro_plane_png extends lime.graphics.Image {}
@:image("assets/images/intro/text0.png") #if display private #end class __ASSET__assets_images_intro_text0_png extends lime.graphics.Image {}
@:image("assets/images/intro/text1.png") #if display private #end class __ASSET__assets_images_intro_text1_png extends lime.graphics.Image {}
@:image("assets/images/intro/text2.png") #if display private #end class __ASSET__assets_images_intro_text2_png extends lime.graphics.Image {}
@:image("assets/images/intro/text3.png") #if display private #end class __ASSET__assets_images_intro_text3_png extends lime.graphics.Image {}
@:image("assets/images/intro/tower.png") #if display private #end class __ASSET__assets_images_intro_tower_png extends lime.graphics.Image {}
@:image("assets/images/intro/tutorial.png") #if display private #end class __ASSET__assets_images_intro_tutorial_png extends lime.graphics.Image {}
@:image("assets/images/intro/vab.png") #if display private #end class __ASSET__assets_images_intro_vab_png extends lime.graphics.Image {}
@:image("assets/images/launchblock/cloud0.png") #if display private #end class __ASSET__assets_images_launchblock_cloud0_png extends lime.graphics.Image {}
@:image("assets/images/launchblock/cloud1.png") #if display private #end class __ASSET__assets_images_launchblock_cloud1_png extends lime.graphics.Image {}
@:image("assets/images/launchblock/launch-thin-window.png") #if display private #end class __ASSET__assets_images_launchblock_launch_thin_window_png extends lime.graphics.Image {}
@:file("assets/images/launchblock/launch-thin-window.png.meta") #if display private #end class __ASSET__assets_images_launchblock_launch_thin_window_png_meta extends lime.utils.ByteArray {}
@:file("assets/images/launchblock/nh-atlas-v.pdn.meta") #if display private #end class __ASSET__assets_images_launchblock_nh_atlas_v_pdn_meta extends lime.utils.ByteArray {}
@:file("assets/images/launchblock/nh-launch-block.pdn.meta") #if display private #end class __ASSET__assets_images_launchblock_nh_launch_block_pdn_meta extends lime.utils.ByteArray {}
@:file("assets/images/launchblock/nh-launch-block.png.meta") #if display private #end class __ASSET__assets_images_launchblock_nh_launch_block_png_meta extends lime.utils.ByteArray {}
@:file("assets/images/launchblock/nh-launch-long - Copy.pdn.meta") #if display private #end class __ASSET__assets_images_launchblock_nh_launch_long___copy_pdn_meta extends lime.utils.ByteArray {}
@:file("assets/images/launchblock/nh-launch-long-old.pdn.meta") #if display private #end class __ASSET__assets_images_launchblock_nh_launch_long_old_pdn_meta extends lime.utils.ByteArray {}
@:file("assets/images/launchblock/nh-launch-long.pdn.meta") #if display private #end class __ASSET__assets_images_launchblock_nh_launch_long_pdn_meta extends lime.utils.ByteArray {}
@:file("assets/images/launchblock/nh-launch-long.png.meta") #if display private #end class __ASSET__assets_images_launchblock_nh_launch_long_png_meta extends lime.utils.ByteArray {}
@:file("assets/images/launchblock/nh-pastel.png.meta") #if display private #end class __ASSET__assets_images_launchblock_nh_pastel_png_meta extends lime.utils.ByteArray {}
@:file("assets/images/launchblock/nh-postcard - Copy - Copy.png.meta") #if display private #end class __ASSET__assets_images_launchblock_nh_postcard___copy___copy_png_meta extends lime.utils.ByteArray {}
@:file("assets/images/launchblock/nh-postcard - Copy.pdn.meta") #if display private #end class __ASSET__assets_images_launchblock_nh_postcard___copy_pdn_meta extends lime.utils.ByteArray {}
@:file("assets/images/launchblock/nh-postcard - Copy.png.meta") #if display private #end class __ASSET__assets_images_launchblock_nh_postcard___copy_png_meta extends lime.utils.ByteArray {}
@:file("assets/images/launchblock/nh-postcard-skeu.png.meta") #if display private #end class __ASSET__assets_images_launchblock_nh_postcard_skeu_png_meta extends lime.utils.ByteArray {}
@:file("assets/images/launchblock/nh-postcard.pdn.meta") #if display private #end class __ASSET__assets_images_launchblock_nh_postcard_pdn_meta extends lime.utils.ByteArray {}
@:file("assets/images/launchblock/nh-postcard.png.meta") #if display private #end class __ASSET__assets_images_launchblock_nh_postcard_png_meta extends lime.utils.ByteArray {}
@:image("assets/images/launchblock/pad-norocket.png") #if display private #end class __ASSET__assets_images_launchblock_pad_norocket_png extends lime.graphics.Image {}
@:image("assets/images/launchblock/pad-rocket.png") #if display private #end class __ASSET__assets_images_launchblock_pad_rocket_png extends lime.graphics.Image {}
@:image("assets/images/launchblock/skyback - Copy.png") #if display private #end class __ASSET__assets_images_launchblock_skyback___copy_png extends lime.graphics.Image {}
@:image("assets/images/launchblock/skyback.png") #if display private #end class __ASSET__assets_images_launchblock_skyback_png extends lime.graphics.Image {}
@:image("assets/images/logo.png") #if display private #end class __ASSET__assets_images_logo_png extends lime.graphics.Image {}
@:image("assets/images/logoflicker.png") #if display private #end class __ASSET__assets_images_logoflicker_png extends lime.graphics.Image {}
@:file("assets/images/menu/button originals/buttontemplate - Copy.pdn") #if display private #end class __ASSET__assets_images_menu_button_originals_buttontemplate___copy_pdn extends lime.utils.ByteArray {}
@:file("assets/images/menu/button originals/button_begin.pdn") #if display private #end class __ASSET__assets_images_menu_button_originals_button_begin_pdn extends lime.utils.ByteArray {}
@:file("assets/images/menu/button originals/button_mute.pdn") #if display private #end class __ASSET__assets_images_menu_button_originals_button_mute_pdn extends lime.utils.ByteArray {}
@:file("assets/images/menu/button originals/button_pad.pdn") #if display private #end class __ASSET__assets_images_menu_button_originals_button_pad_pdn extends lime.utils.ByteArray {}
@:file("assets/images/menu/button originals/button_quit.pdn") #if display private #end class __ASSET__assets_images_menu_button_originals_button_quit_pdn extends lime.utils.ByteArray {}
@:file("assets/images/menu/button originals/button_settings.pdn") #if display private #end class __ASSET__assets_images_menu_button_originals_button_settings_pdn extends lime.utils.ByteArray {}
@:file("assets/images/menu/button originals/d_warning.pdn") #if display private #end class __ASSET__assets_images_menu_button_originals_d_warning_pdn extends lime.utils.ByteArray {}
@:file("assets/images/menu/buttontemplate.pdn") #if display private #end class __ASSET__assets_images_menu_buttontemplate_pdn extends lime.utils.ByteArray {}
@:image("assets/images/menu/button_about.png") #if display private #end class __ASSET__assets_images_menu_button_about_png extends lime.graphics.Image {}
@:image("assets/images/menu/button_back.png") #if display private #end class __ASSET__assets_images_menu_button_back_png extends lime.graphics.Image {}
@:image("assets/images/menu/button_begin.png") #if display private #end class __ASSET__assets_images_menu_button_begin_png extends lime.graphics.Image {}
@:image("assets/images/menu/button_debug.png") #if display private #end class __ASSET__assets_images_menu_button_debug_png extends lime.graphics.Image {}
@:image("assets/images/menu/button_f.png") #if display private #end class __ASSET__assets_images_menu_button_f_png extends lime.graphics.Image {}
@:image("assets/images/menu/button_facts.png") #if display private #end class __ASSET__assets_images_menu_button_facts_png extends lime.graphics.Image {}
@:image("assets/images/menu/button_full.png") #if display private #end class __ASSET__assets_images_menu_button_full_png extends lime.graphics.Image {}
@:image("assets/images/menu/button_pad.png") #if display private #end class __ASSET__assets_images_menu_button_pad_png extends lime.graphics.Image {}
@:image("assets/images/menu/button_pluto.png") #if display private #end class __ASSET__assets_images_menu_button_pluto_png extends lime.graphics.Image {}
@:image("assets/images/menu/button_quit.png") #if display private #end class __ASSET__assets_images_menu_button_quit_png extends lime.graphics.Image {}
@:image("assets/images/menu/button_rand.png") #if display private #end class __ASSET__assets_images_menu_button_rand_png extends lime.graphics.Image {}
@:image("assets/images/menu/button_setting.png") #if display private #end class __ASSET__assets_images_menu_button_setting_png extends lime.graphics.Image {}
@:image("assets/images/menu/button_settings.png") #if display private #end class __ASSET__assets_images_menu_button_settings_png extends lime.graphics.Image {}
@:image("assets/images/menu/coordsblock.png") #if display private #end class __ASSET__assets_images_menu_coordsblock_png extends lime.graphics.Image {}
@:image("assets/images/menu/d_warning.png") #if display private #end class __ASSET__assets_images_menu_d_warning_png extends lime.graphics.Image {}
@:image("assets/images/menu/d_warn_cancel.png") #if display private #end class __ASSET__assets_images_menu_d_warn_cancel_png extends lime.graphics.Image {}
@:file("assets/images/menu/d_warn_ok.pdn") #if display private #end class __ASSET__assets_images_menu_d_warn_ok_pdn extends lime.utils.ByteArray {}
@:image("assets/images/menu/d_warn_ok.png") #if display private #end class __ASSET__assets_images_menu_d_warn_ok_png extends lime.graphics.Image {}
@:image("assets/images/menu/full_exit_notice.png") #if display private #end class __ASSET__assets_images_menu_full_exit_notice_png extends lime.graphics.Image {}
@:image("assets/images/menu/moons/CharonOrbit.png") #if display private #end class __ASSET__assets_images_menu_moons_charonorbit_png extends lime.graphics.Image {}
@:image("assets/images/menu/moons/HydraOrbit.png") #if display private #end class __ASSET__assets_images_menu_moons_hydraorbit_png extends lime.graphics.Image {}
@:image("assets/images/menu/moons/KerberosOrbit.png") #if display private #end class __ASSET__assets_images_menu_moons_kerberosorbit_png extends lime.graphics.Image {}
@:image("assets/images/menu/moons/NixOrbit.png") #if display private #end class __ASSET__assets_images_menu_moons_nixorbit_png extends lime.graphics.Image {}
@:image("assets/images/menu/moons/original/Charon.png") #if display private #end class __ASSET__assets_images_menu_moons_original_charon_png extends lime.graphics.Image {}
@:image("assets/images/menu/moons/original/Hydra.png") #if display private #end class __ASSET__assets_images_menu_moons_original_hydra_png extends lime.graphics.Image {}
@:image("assets/images/menu/moons/original/Kerberos.png") #if display private #end class __ASSET__assets_images_menu_moons_original_kerberos_png extends lime.graphics.Image {}
@:image("assets/images/menu/moons/original/Nix.png") #if display private #end class __ASSET__assets_images_menu_moons_original_nix_png extends lime.graphics.Image {}
@:image("assets/images/menu/moons/original/Styx.png") #if display private #end class __ASSET__assets_images_menu_moons_original_styx_png extends lime.graphics.Image {}
@:image("assets/images/menu/moons/Pluto.png") #if display private #end class __ASSET__assets_images_menu_moons_pluto_png extends lime.graphics.Image {}
@:image("assets/images/menu/moons/StyxOrbit.png") #if display private #end class __ASSET__assets_images_menu_moons_styxorbit_png extends lime.graphics.Image {}
@:image("assets/images/menu/splash_x640.png") #if display private #end class __ASSET__assets_images_menu_splash_x640_png extends lime.graphics.Image {}
@:image("assets/images/menu/starback.png") #if display private #end class __ASSET__assets_images_menu_starback_png extends lime.graphics.Image {}
@:file("assets/images/misc/320xp.pdn") #if display private #end class __ASSET__assets_images_misc_320xp_pdn extends lime.utils.ByteArray {}
@:image("assets/images/misc/320xp.png") #if display private #end class __ASSET__assets_images_misc_320xp_png extends lime.graphics.Image {}
@:image("assets/images/misc/earth-32x.png") #if display private #end class __ASSET__assets_images_misc_earth_32x_png extends lime.graphics.Image {}
@:image("assets/images/misc/pls.png") #if display private #end class __ASSET__assets_images_misc_pls_png extends lime.graphics.Image {}
@:image("assets/images/mute/Mute.png") #if display private #end class __ASSET__assets_images_mute_mute_png extends lime.graphics.Image {}
@:image("assets/images/mute/MuteOn.png") #if display private #end class __ASSET__assets_images_mute_muteon_png extends lime.graphics.Image {}
@:file("assets/images/NH.ico") #if display private #end class __ASSET__assets_images_nh_ico extends lime.utils.ByteArray {}
@:file("assets/images/nh_large.svg") #if display private #end class __ASSET__assets_images_nh_large_svg extends lime.utils.ByteArray {}
@:image("assets/images/pepssiwire/background.png") #if display private #end class __ASSET__assets_images_pepssiwire_background_png extends lime.graphics.Image {}
@:image("assets/images/pepssiwire/bblue.png") #if display private #end class __ASSET__assets_images_pepssiwire_bblue_png extends lime.graphics.Image {}
@:file("assets/images/pepssiwire/box - Copy.pdn") #if display private #end class __ASSET__assets_images_pepssiwire_box___copy_pdn extends lime.utils.ByteArray {}
@:file("assets/images/pepssiwire/box-mockup.pdn") #if display private #end class __ASSET__assets_images_pepssiwire_box_mockup_pdn extends lime.utils.ByteArray {}
@:image("assets/images/pepssiwire/box-mockup.png") #if display private #end class __ASSET__assets_images_pepssiwire_box_mockup_png extends lime.graphics.Image {}
@:file("assets/images/pepssiwire/box.pdn") #if display private #end class __ASSET__assets_images_pepssiwire_box_pdn extends lime.utils.ByteArray {}
@:image("assets/images/pepssiwire/box.png") #if display private #end class __ASSET__assets_images_pepssiwire_box_png extends lime.graphics.Image {}
@:image("assets/images/pepssiwire/bparcel.png") #if display private #end class __ASSET__assets_images_pepssiwire_bparcel_png extends lime.graphics.Image {}
@:image("assets/images/pepssiwire/bpeach.png") #if display private #end class __ASSET__assets_images_pepssiwire_bpeach_png extends lime.graphics.Image {}
@:image("assets/images/pepssiwire/bpink.png") #if display private #end class __ASSET__assets_images_pepssiwire_bpink_png extends lime.graphics.Image {}
@:image("assets/images/pepssiwire/colors.png") #if display private #end class __ASSET__assets_images_pepssiwire_colors_png extends lime.graphics.Image {}
@:image("assets/images/pepssiwire/dialogback.png") #if display private #end class __ASSET__assets_images_pepssiwire_dialogback_png extends lime.graphics.Image {}
@:image("assets/images/pepssiwire/dialogtext.png") #if display private #end class __ASSET__assets_images_pepssiwire_dialogtext_png extends lime.graphics.Image {}
@:image("assets/images/pepssiwire/old/0bluealt.png") #if display private #end class __ASSET__assets_images_pepssiwire_old_0bluealt_png extends lime.graphics.Image {}
@:image("assets/images/pepssiwire/old/0limealt.png") #if display private #end class __ASSET__assets_images_pepssiwire_old_0limealt_png extends lime.graphics.Image {}
@:image("assets/images/pepssiwire/old/0peachalt.png") #if display private #end class __ASSET__assets_images_pepssiwire_old_0peachalt_png extends lime.graphics.Image {}
@:image("assets/images/pepssiwire/old/0pinkalt.png") #if display private #end class __ASSET__assets_images_pepssiwire_old_0pinkalt_png extends lime.graphics.Image {}
@:image("assets/images/pepssiwire/old/1bluealt.png") #if display private #end class __ASSET__assets_images_pepssiwire_old_1bluealt_png extends lime.graphics.Image {}
@:image("assets/images/pepssiwire/old/1limealt.png") #if display private #end class __ASSET__assets_images_pepssiwire_old_1limealt_png extends lime.graphics.Image {}
@:image("assets/images/pepssiwire/old/1peachalt.png") #if display private #end class __ASSET__assets_images_pepssiwire_old_1peachalt_png extends lime.graphics.Image {}
@:image("assets/images/pepssiwire/old/1pinkalt.png") #if display private #end class __ASSET__assets_images_pepssiwire_old_1pinkalt_png extends lime.graphics.Image {}
@:image("assets/images/pepssiwire/original/0blue.png") #if display private #end class __ASSET__assets_images_pepssiwire_original_0blue_png extends lime.graphics.Image {}
@:image("assets/images/pepssiwire/original/0lime.png") #if display private #end class __ASSET__assets_images_pepssiwire_original_0lime_png extends lime.graphics.Image {}
@:image("assets/images/pepssiwire/original/0peach.png") #if display private #end class __ASSET__assets_images_pepssiwire_original_0peach_png extends lime.graphics.Image {}
@:image("assets/images/pepssiwire/original/0pink.png") #if display private #end class __ASSET__assets_images_pepssiwire_original_0pink_png extends lime.graphics.Image {}
@:file("assets/images/pepssiwire/parcel.pdn") #if display private #end class __ASSET__assets_images_pepssiwire_parcel_pdn extends lime.utils.ByteArray {}
@:image("assets/images/pepssiwire/parcel.png") #if display private #end class __ASSET__assets_images_pepssiwire_parcel_png extends lime.graphics.Image {}
@:file("assets/images/pepssiwire/sgsgsg.pdn") #if display private #end class __ASSET__assets_images_pepssiwire_sgsgsg_pdn extends lime.utils.ByteArray {}
@:file("assets/images/pepssiwire/Untitled.pdn") #if display private #end class __ASSET__assets_images_pepssiwire_untitled_pdn extends lime.utils.ByteArray {}
@:image("assets/images/pepssiwire/Untitled.png") #if display private #end class __ASSET__assets_images_pepssiwire_untitled_png extends lime.graphics.Image {}
@:file("assets/images/reference.txt") #if display private #end class __ASSET__assets_images_reference_txt extends lime.utils.ByteArray {}
@:file("assets/images/rtgrun/background.pdn") #if display private #end class __ASSET__assets_images_rtgrun_background_pdn extends lime.utils.ByteArray {}
@:image("assets/images/rtgrun/background.png") #if display private #end class __ASSET__assets_images_rtgrun_background_png extends lime.graphics.Image {}
@:image("assets/images/rtgrun/clouds.png") #if display private #end class __ASSET__assets_images_rtgrun_clouds_png extends lime.graphics.Image {}
@:file("assets/images/rtgrun/mockup.pdn") #if display private #end class __ASSET__assets_images_rtgrun_mockup_pdn extends lime.utils.ByteArray {}
@:file("assets/images/rtgrun/placeholder.pdn") #if display private #end class __ASSET__assets_images_rtgrun_placeholder_pdn extends lime.utils.ByteArray {}
@:image("assets/images/rtgrun/placeholder.png") #if display private #end class __ASSET__assets_images_rtgrun_placeholder_png extends lime.graphics.Image {}
@:image("assets/images/rtgrun/sky.png") #if display private #end class __ASSET__assets_images_rtgrun_sky_png extends lime.graphics.Image {}
@:image("assets/images/settings/button_fullscreen.png") #if display private #end class __ASSET__assets_images_settings_button_fullscreen_png extends lime.graphics.Image {}
@:image("assets/images/settings/button_fullscreen_alt.png") #if display private #end class __ASSET__assets_images_settings_button_fullscreen_alt_png extends lime.graphics.Image {}
@:image("assets/images/settings/button_sound.png") #if display private #end class __ASSET__assets_images_settings_button_sound_png extends lime.graphics.Image {}
@:image("assets/images/settings/button_sound_alt.png") #if display private #end class __ASSET__assets_images_settings_button_sound_alt_png extends lime.graphics.Image {}
@:file("assets/images/settings/originals/button_fullscreen.pdn") #if display private #end class __ASSET__assets_images_settings_originals_button_fullscreen_pdn extends lime.utils.ByteArray {}
@:file("assets/images/settings/originals/button_sound.pdn") #if display private #end class __ASSET__assets_images_settings_originals_button_sound_pdn extends lime.utils.ByteArray {}
@:image("assets/images/settings/title_settings.png") #if display private #end class __ASSET__assets_images_settings_title_settings_png extends lime.graphics.Image {}
@:file("assets/music/menu-main2.wav") #if display private #end class __ASSET__assets_music_menu_main2_wav extends lime.utils.ByteArray {}
@:file("assets/music/music_credits.txt") #if display private #end class __ASSET__assets_music_music_credits_txt extends lime.utils.ByteArray {}
@:file("assets/sounds/data.wav") #if display private #end class __ASSET__assets_sounds_data_wav extends lime.utils.ByteArray {}
@:file("assets/sounds/error.wav") #if display private #end class __ASSET__assets_sounds_error_wav extends lime.utils.ByteArray {}
@:file("assets/sounds/get.wav") #if display private #end class __ASSET__assets_sounds_get_wav extends lime.utils.ByteArray {}
@:file("assets/sounds/introtone.mp3") #if display private #end class __ASSET__assets_sounds_introtone_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/introtone.wav") #if display private #end class __ASSET__assets_sounds_introtone_wav extends lime.utils.ByteArray {}
@:file("assets/sounds/Pickup_Coin.wav") #if display private #end class __ASSET__assets_sounds_pickup_coin_wav extends lime.utils.ByteArray {}
@:file("assets/sounds/select.wav") #if display private #end class __ASSET__assets_sounds_select_wav extends lime.utils.ByteArray {}
@:file("assets/sounds/signal.wav") #if display private #end class __ASSET__assets_sounds_signal_wav extends lime.utils.ByteArray {}
@:font("C:/HaxeToolkit/haxe/lib/flixel/3,3,12/assets/fonts/nokiafc22.ttf") #if display private #end class __ASSET__assets_fonts_nokiafc22_ttf extends lime.text.Font {}
@:font("C:/HaxeToolkit/haxe/lib/flixel/3,3,12/assets/fonts/arial.ttf") #if display private #end class __ASSET__assets_fonts_arial_ttf extends lime.text.Font {}



#end
#end

#if (openfl && !flash)
@:keep #if display private #end class __ASSET__OPENFL__assets_fonts_oratorstd_otf extends openfl.text.Font { public function new () { var font = new __ASSET__assets_fonts_oratorstd_otf (); src = font.src; name = font.name; super (); }}
@:keep #if display private #end class __ASSET__OPENFL__assets_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { var font = new __ASSET__assets_fonts_nokiafc22_ttf (); src = font.src; name = font.name; super (); }}
@:keep #if display private #end class __ASSET__OPENFL__assets_fonts_arial_ttf extends openfl.text.Font { public function new () { var font = new __ASSET__assets_fonts_arial_ttf (); src = font.src; name = font.name; super (); }}

#end

#end


#end