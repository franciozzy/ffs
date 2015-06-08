DATAPATH_COMMANDS=Datapath.activate  Datapath.attach  Datapath.deactivate  Datapath.detach
FFS_COMMANDS=Plugin.Query Plugin.diagnostics SR.create SR.ls SR.destroy SR.attach SR.detach Volume.create Volume.destroy Volume.stat Volume.clone
BTRFS_COMMANDS=Plugin.Query Plugin.diagnostics SR.create SR.ls SR.destroy SR.attach SR.detach Volume.create Volume.destroy Volume.stat Volume.clone common.py
LIB_FILES=losetup.py tapdisk.py dmsetup.py nbdclient.py nbdtool.py image.py common.py

.PHONY: clean
clean:

DESTDIR?=/
SCRIPTDIR?=/usr/libexec/xapi-storage-script
PYTHONDIR?=/usr/lib/python2.7/site-packages/xapi

.PHONY: install
install:
	mkdir -p $(DESTDIR)$(SCRIPTDIR)/datapath/raw+file
	(cd datapath/raw+file; install -m 0755 $(DATAPATH_COMMANDS) $(DESTDIR)$(SCRIPTDIR)/datapath/raw+file)
	mkdir -p $(DESTDIR)$(SCRIPTDIR)/volume/org.xen.xcp.storage.ffs
	(cd volume/org.xen.xcp.storage.ffs; install -m 0755 $(FFS_COMMANDS) $(DESTDIR)$(SCRIPTDIR)/volume/org.xen.xcp.storage.ffs)
	mkdir -p $(DESTDIR)$(SCRIPTDIR)/volume/org.xen.xcp.storage.btrfs
	(cd volume/org.xen.xcp.storage.btrfs; install -m 0755 $(BTRFS_COMMANDS) $(DESTDIR)$(SCRIPTDIR)/volume/org.xen.xcp.storage.btrfs)
	mkdir -p $(DESTDIR)$(PYTHONDIR)
	(cd lib; install -m 0755 $(LIB_FILES) $(DESTDIR)$(PYTHONDIR)/)
