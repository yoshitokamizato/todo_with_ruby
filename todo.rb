require 'date'
require 'active_support/all'
require "thor"
require "./task.rb"
require "./dialog.rb"

class Todo
  # 呼び出されるメソッドがインスタンスメソッドとして呼ばれる
  # Todoがインスタンス化されているから
  include Dialog

  attr_accessor :tasks

  def initialize
    @tasks = []
    @id = 0
    @name = ''
    @contents = ''
    @priority = 0
    @deadline = Date.new(2019, 06, 02)
    @created_at = Date.today
  end

  # タスクの一覧表示
  def index
    if @tasks.empty?
      no_registered_task_message
    else
      # EOS：end of string
      puts <<~EOS

      【一覧】
      EOS

      tasks.each do |task|
        tasks_overview_message(task)
      end
    end
  end

  def show
    puts "詳細表示するタスクを選んでください"
    print "タスクNo."

    # 選択されたタスク
    task = find_task_id(task_args)

    binding.pry

    if tasks.size != 0
      task_details_message(task)
    else
      no_registered_task_message
    end
  end

  def create
    puts "タスクを登録してください"
    @id += 1

    print "名前："
    @name = gets.chomp
    print "内容："
    @contents = gets.chomp
    print "優先度（1~5）："
    @priority = gets.chomp

    year = Date.today.year.to_i
    print "期限（月）："
    month = gets.chomp.to_i
    print "期限（日）："
    day = gets.chomp.to_i
    @deadline = Date.new(year, month, day)

    @created_at = Date.today

    @tasks << Task.new(@id, @name, @contents, @priority, @deadline, @created_at)

  end

  def update
    puts "どのタスクを更新しますか？"
    print "タスクNo."

    result = find_task_id(task_args)

    puts "タスクを登録してください"

    print "名前："
    @name = gets.chomp

    print "内容："
    @contents = gets.chomp

    print "優先度（1~5）："
    @priority = gets.chomp

    year = Date.today.year.to_i
    print "期限（月）："
    month = gets.chomp.to_i
    print "期限（日）："
    day = gets.chomp.to_i
    @deadline = Date.new(year, month, day)

    @created_at = Date.today

    result.name = @name
    result.contents = @contents
    result.priority = @priority
    result.deadline = @deadline
    result.created_at = @created_at
  end

  def delete
    puts "削除するタスクNoを選んでください"
    print "タスクNo."

    selected_task = find_task_id(task_args)

    if selected_task.present?
      delete_confirm_messate(selected_task)
      loop do
        print "入力："
        command = gets.chomp

        # タスク削除
        @tasks.delete_if {|task| task.id == selected_task.id}

        delete_result_message(command)

        break if command == "y" || command == "n"
      end
    else
      no_registered_task_message
    end
  end

  private

  def find_task_id(tasks)
    @tasks.find do |task|
      task.id == tasks[:index_num]
    end
  end

  def task_args
    index_num = gets.chomp.to_i
    {tasks: @tasks, index_num: index_num}
  end

end
