# ModSkeleton

- Targets UE 4.20 Preview 3

```
Copyright 2017 Smogworks

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```

## Goals

- To be a go-to example for Unreal Engine 4 modding support.
- To not require core engine changes - work with prebuilt UE4 Editor from Epig Games Launcher.

## Get it Running (Manually)

1. Clone the Repo
1. Open ModSkeleton.uproject
1. Be sure to select "View Options" -> "Show Plugin Content" in the Content browser to see Example Plugin Content
1. Follow [Instruction to Build Custom Launcher Profiles](doc/build_profiles/build_profiles.md)
1. Disable the ModSkeletonExamplePluginA plugin (Edit -> Plugins -> "ModSkeleton" section)
1. Execute the Full Game launch profile for your platform
1. Enable the ModSkeletonExamplePluginA plugin
1. Execute the Mod launch profile for you platform - note this may fail, but not before generating the needed Pak file
1. Copy Plugins/ModSkeletonExamplePluginA/Saved/StagedBuilds/[platform]/ModSkeleton/Plugins/ModSkeletonExamplePluginA/Content/Paks/[platform]/ModSkeletonExamplePluginA.pak to Saved/StagedBuilds/[platform]/ModSkeleton/Mods/ (If you are building for Win64+WindowsNoEditor, you may run CopyExeAndPak.bat)
1. Execute "Saved/StagedBuilds/[platform]/[ModSkeleton executable]

## Develop plugin

### Develop just contents

1. Enable the ModSkeletonExamplePluginA plugin
1. Develop as normal UE4 project.

Note: This is the easiest way to develop the plugin. But you can't confirm the behavior of MOD load hook function

### Loading Pak files an debug the program

1. Develop and place MOD pak file in the proper location
1. Build Debug or DebugGame build from Visual Studio.
1. Copy Binaries/[architecture]/* to Saved/StagedBuilds/[platform]/ModSkeleton/Binaries/[architecture]/
1. Run executable in Saved/StagedBuilds/[platform]/ModSkeleton/Binaries/[architecture]/
1. Attach Visual Studio debugger to running process

Note: So far, I haven't succeeded to load assets from Pak file from debug build directly launched from Visual Studio

## Architecture

### Startup

- ModSkeletonGameInstance initializes and keeps a reference to a single ModSkeletonRegistry instance
- ModSkeletonRegistry scans the Mods directory for matching Pak (".pak") files and load them all. Also loads AssetRegistry.bin in the Pak file
- ModSkeletonRegistry searches the in-memory AssetRegistry for all classes whos name begins with "MOD_SKELETON" and who implement ModSkeletonPluginInterface
- The plugin interface is invoked once as "ModSkeletonInit" allowing these mods to register, connect, and/or invoke mod Hooks

### ModSkeleton Hooks

- BPVariant is a uobject based blueprint friendly variant class to support easy data interchange through hook invokes
- Hooks marked "Always Invoke" (like the "ModSkeletonInit" hook) will be called once for every loaded MOD_SKELETON init interface
- Hooks NOT marked "Always Invoke" will only be called if they have been Connected, and will be called in priority order
- Hooks will be passed a reference to an array of BPVariants. This "HookIO" will be used as both input and output, and allows hooks to modify core behavior:

Imagine a registered hook that is requesting a list of main menu items. The base game could begin this list with buttons labeled "New Game", "Load Game", and "Exit". Someone could create a mod that adjusts this list, replacing the "New Game" button with one that leads to a different character creation screen. Psuedo Code:

```
class CoreGame implements ModSkeletonPluginInterface
  function ModSkeletonHook(String HookName, BPVariantArray HookIO)
    if HookName == "PopulateMainMenu"
      HookIO[0].Add( NewGameButton )
      HookIO[0].Add( LoadGameButton )
      HookIO[0].Add( ExitButton )
    end if
  end function
end class

class MyNewCharacterMod implements ModSkeletonPluginInterface
  function ModSkeletonHook(String HookName, BPVariantArray HookIO)
    if HookName == "PopulateMainMenu"
      HookIO[0].RemoveItem( NewGameButton )
      HookIO[0].Prepend( MyBetterNewGameButton )
    end if
  end function
end class
```

## TODO

- Example CPP plugin
- Find a way to load Pak file from Debug or DebugGame build launched from Visual Studio

## Questions

- Better way to distribute? Could make the core stuff a plugin... but then other plugins would have to depend on headers in it...
- BPVariant blueprint constructor helpers seem a little kludgy (especially with the hidden world context -> outer pins) any way to make that better?
- HookIO TArray< BPVariant* > in-out pins cause more copying than I was hoping for... better way to solve that? I'd like to just modify the passed in reference, but then it shows up as an output on the return node...
