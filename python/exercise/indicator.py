from gi.repository import Gtk
from gi.repository import AppIndicator3 as appindicator
from gi.repository import GLib


class MyIndicator:
    def __init__(self):
        self.ind = appindicator.Indicator.new(
            "Test",
            "indicator-messages",
            appindicator.IndicatorCategory.APPLICATION_STATUS)
        self.ind.set_status(appindicator.IndicatorStatus.ACTIVE)
        self.ind.set_attention_icon("new-messages-red")
        self.menu = Gtk.Menu()

    def main(self):
        self.check_site()
        GLib.timeout_add_seconds(60, self.check_site)
        Gtk.main()

    def clear(self, widget):
        self.hash = self.remote_hash
        self.ind.set_status(appindicator.IndicatorStatus.ACTIVE)

    def check_site(self):
        self.ind.set_status(appindicator.IndicatorStatus.ATTENTION)
        return True

    def quit(self, widget):
        Gtk.main_quit()

if __name__ == '__main__':
    indicator = MyIndicator()
    indicator.main()
