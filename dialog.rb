module Dialog

  def opening_todo_message
    puts <<~EOS

    【TODOリスト管理システム】
    自分がやるべきことを管理し、圧倒的な生産性を手に入れましょう。

    EOS
  end

  # TODO もっとメソッド名良い感じに
  def select_command_message
    puts <<~EOS

    【タスク管理】
    一覧 => 1
    詳細 => 2
    登録 => 3
    更新 => 4
    削除 => 5
    終了 => 6

    EOS

    print "コマンド："
  end

  # TODO もっとメソッド名良い感じに
  def no_registered_task_message
    puts <<~EOS

    登録されているタスクはありません

    EOS
  end

  def tasks_overview_message(task)
    puts <<~EOS

    No.#{task.id}
    タスク名：#{task.name}
    優先順位：#{task.priority}
    期限：#{task.deadline}

    EOS
  end

  def task_details_message(task)
    puts <<~EOS

    【詳細】
    タスク名：#{task.name}
    内容：#{task.contents}
    優先順位：#{task.priority}
    期限：#{task.deadline}
    作成日：#{task.created_at}

    EOS
  end

  def delete_confirm_messate(task)
    puts <<~TEXT

    以下のタスクを削除しますか？

    タスク名：#{task.name}
    内容：#{task.contents}
    優先順位：#{task.priority}
    期限：#{task.deadline}
    作成日：#{task.created_at}

    はい => y
    いいえ => n

    TEXT
  end

  def delete_result_message(command)
    if command == "y"
      puts <<~TEXT

      削除しました。

      TEXT
    elsif command == "n"
      puts <<~TEXT

      削除をキャンセルしました。

      TEXT
    else
      puts <<~TEXT

      無効なコマンドです。
      もう一度、入力をお願いします。

      はい => y
      いいえ => n

      TEXT
    end
  end

end
