require "pry"
require "./dialog.rb"
require "./tasks_controller.rb"

class Main
  extend Dialog
  extend Tasks_controller

  opening_todo_message

  start_todo

end
