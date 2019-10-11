require "./todo.rb"

module Tasks_controller
  INDEX = 1
  SHOW = 2
  CREATE = 3
  UPDATE = 4
  DELETE = 5
  BREAK = 6

  def start_todo
    build_todo
    loop_todo
  end

  private

    def build_todo
      @todo = Todo.new
    end

    def loop_todo
      loop do
        selected_num = select_todo_command

        break if selected_num == BREAK
        
        execute_todo_instruction(selected_num)
      end
    end

    def select_todo_command
      select_command_message
      selected_num = gets.chomp.to_i

      selected_num
    end

    def execute_todo_instruction(selected_num)
      case selected_num
      when INDEX
        @todo.index
      when SHOW
        @todo.show
      when CREATE
        @todo.create
      when UPDATE
        @todo.update
      when DELETE
        @todo.delete
      end
    end
end
