package io.flutter.plugins;

import io.flutter.plugin.common.PluginRegistry;
import come.drop_down_list.DropDownListPlugin;
import com.crazecoder.flutterbugly.FlutterBuglyPlugin;

/**
 * Generated file. Do not edit.
 */
public final class GeneratedPluginRegistrant {
  public static void registerWith(PluginRegistry registry) {
    if (alreadyRegisteredWith(registry)) {
      return;
    }
    DropDownListPlugin.registerWith(registry.registrarFor("come.drop_down_list.DropDownListPlugin"));
    FlutterBuglyPlugin.registerWith(registry.registrarFor("com.crazecoder.flutterbugly.FlutterBuglyPlugin"));
  }

  private static boolean alreadyRegisteredWith(PluginRegistry registry) {
    final String key = GeneratedPluginRegistrant.class.getCanonicalName();
    if (registry.hasPlugin(key)) {
      return true;
    }
    registry.registrarFor(key);
    return false;
  }
}
