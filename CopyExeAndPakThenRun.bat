mkdir .\Mods
copy /Y .\Plugins\ModSkeletonExamplePluginA\Saved\StagedBuilds\WindowsNoEditor\ModSkeleton\Plugins\ModSkeletonExamplePluginA\Content\Paks\WindowsNoEditor\ModSkeletonExamplePluginA.pak .\Mods\ModSkeletonExamplePluginA.pak

mkdir .\Saved\StagedBuilds\WindowsNoEditor\ModSkeleton\Mods
copy /Y .\Mods\* .\Saved\StagedBuilds\WindowsNoEditor\ModSkeleton\Mods

copy /Y .\Binaries\Win64\* .\Saved\StagedBuilds\WindowsNoEditor\ModSkeleton\Binaries\Win64
