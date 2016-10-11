require 'tk'
require 'tkextlib/bwidget'

root = TkRoot.new
root.title = "Window"

combobox = Tk::BWidget::ComboBox.new(root)
combobox.values = [1, 2, 3, 4]
combobox.place('height' => 25,
               'width'  => 100,
               'x'      => 10,
               'y'      => 10)

Tk.mainloop