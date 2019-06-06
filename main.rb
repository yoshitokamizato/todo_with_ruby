require "pry"
require "./todo.rb"

# インスタンス化する理由
# 毎回保持する情報が違う

# クラス変数で処理をする：情報を保持するイメージがない（インスタンス化しないから）
# クラスメソッド：毎回保持する情報が同じ
@todo = Todo.new

INDEX = 1
SHOW = 2
CREATE = 3
UPDATE = 4
DELETE = 5

loop do
  puts <<~TEXT

  【タスク管理】
  一覧 => 1
  詳細 => 2
  登録 => 3
  更新 => 4
  削除 => 5
  TEXT

  print "コマンド："
  selected_num = gets.chomp.to_i

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
