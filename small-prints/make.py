import pathlib,subprocess,argparse
args = argparse.ArgumentParser()
args.add_argument("mode",choices=["info","thumb"],default="info")
ns = args.parse_args().__dict__
globals().update(ns)
print("mode:",mode)
if mode == "info":
    print("INFO")
elif mode == "thumb":
    gmicp = pathlib.Path("C:\Program Files\gmic-2.9.7-cli-win64\gmic.exe")
    thumbp = pathlib.Path("thumb").resolve()
    assert gmicp.exists()
    assert thumbp.exists()
    cwd = pathlib.Path.cwd()
    gmic = str(gmicp)
    for a,b,will_overwrite in [
            [
                str(img),str(thumbp/img.name),(thumbp/img.name).exists()
             ] for img in cwd.glob("*.png")]:
        print("will_overwrite:",will_overwrite)
        cmd = [gmic,a,"resize_ratio2d","256,256","output",b]
        p = subprocess.run(cmd,capture_output=True)
        print(p)

