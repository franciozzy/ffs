DATAPATH_COMMANDS=Datapath.activate  Datapath.attach  Datapath.deactivate  Datapath.detach
FFS_COMMANDS=Plugin.Query Plugin.diagnostics SR.create SR.ls SR.destroy SR.attach SR.detach SR.stat Volume.create Volume.destroy Volume.stat Volume.clone Volume.snapshot Volume.resize
BTRFS_COMMANDS=Plugin.Query Plugin.diagnostics SR.create SR.ls SR.destroy SR.attach SR.detach SR.stat Volume.create Volume.destroy Volume.stat Volume.clone Volume.snapshot Volume.resize common.py
RAWNFS_COMMANDS=Plugin.Query Plugin.diagnostics SR.create SR.ls SR.destroy SR.attach SR.detach SR.stat Volume.create Volume.destroy Volume.stat Volume.resize common.py
GFS2_COMMANDS=Plugin.Query Plugin.diagnostics SR.create SR.ls SR.destroy SR.attach SR.detach SR.stat Volume.create Volume.destroy Volume.stat Volume.snapshot common.py
LIB_FILES=losetup.py tapdisk.py dmsetup.py nbdclient.py nbdtool.py image.py common.py

.PHONY: clean
clean:

DESTDIR?=/
SCRIPTDIR?=/usr/libexec/xapi-storage-script
PYTHONDIR?=/usr/lib/python2.7/site-packages/xapi

.PHONY: install
install:
	mkdir -p $(DESTDIR)$(SCRIPTDIR)/datapath/loop+blkback
	(cd datapath/loop+blkback; install -m 0755 $(DATAPATH_COMMANDS) $(DESTDIR)$(SCRIPTDIR)/datapath/loop+blkback)
	mkdir -p $(DESTDIR)$(SCRIPTDIR)/datapath/tapdisk
	(cd datapath/tapdisk; install -m 0755 $(DATAPATH_COMMANDS) $(DESTDIR)$(SCRIPTDIR)/datapath/tapdisk)
	(cd $(DESTDIR)$(SCRIPTDIR)/datapath ; ln -snf tapdisk raw+file ; ln -snf tapdisk vhd+file)
	mkdir -p $(DESTDIR)$(SCRIPTDIR)/volume/org.xen.xcp.storage.ffs
	(cd volume/org.xen.xcp.storage.ffs; install -m 0755 $(FFS_COMMANDS) $(DESTDIR)$(SCRIPTDIR)/volume/org.xen.xcp.storage.ffs)
	mkdir -p $(DESTDIR)$(SCRIPTDIR)/volume/org.xen.xcp.storage.btrfs
	(cd volume/org.xen.xcp.storage.btrfs; install -m 0755 $(BTRFS_COMMANDS) $(DESTDIR)$(SCRIPTDIR)/volume/org.xen.xcp.storage.btrfs)
	mkdir -p $(DESTDIR)$(SCRIPTDIR)/volume/org.xen.xcp.storage.rawnfs
	(cd volume/org.xen.xcp.storage.rawnfs; install -m 0755 $(RAWNFS_COMMANDS) $(DESTDIR)$(SCRIPTDIR)/volume/org.xen.xcp.storage.rawnfs)
	mkdir -p $(DESTDIR)$(SCRIPTDIR)/volume/org.xen.xcp.storage.gfs2
	(cd volume/org.xen.xcp.storage.gfs2; install -m 0755 $(GFS2_COMMANDS) $(DESTDIR)$(SCRIPTDIR)/volume/org.xen.xcp.storage.gfs2)
	mkdir -p $(DESTDIR)$(PYTHONDIR)
	(cd lib; install -m 0755 $(LIB_FILES) $(DESTDIR)$(PYTHONDIR)/)
