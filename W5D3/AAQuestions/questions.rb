require 'sqlite3'
require 'singleton'
# require 'questions.db'

class QuestionsDatabase < SQLite3::Database
  include Singleton

  def initialize
    super('questions.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class User
  attr_accessor :fname, :lname

  def initialize(options)
    @id = options['id']
    @fname = options['fname']
    @lname = options['lname']
  end
  
  def self.find_by_id(id)
    user = QuestionsDatabase.instance.execute(<<-SQL, id)
    SELECT
    *
    FROM 
    users
    WHERE
    id = ?
    SQL
    raise "id does not exist in db" if user.empty?
    User.new(user.first)
  end

  def self.find_by_name(fname, lname)
    user = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
    SELECT
    *
    FROM 
    users
    WHERE
    fname = ? AND lname = ?
    SQL
    raise "name does not exist in db" if user.empty?
    User.new(user.first)
  end
  
  def authored_questions
    Question.find_by_author_id(@id)
  end

  def authored_replies
    Reply.find_by_user_id(@id)
  end

  def followed_questions
    QuestionFollow.followed_questions_for_user_id(@id)
  end

  def liked_questions
    QuestionLike.liked_questions_for_user_id(@id)
  end

  def average_karma

  end
end

class Question
  attr_accessor :title, :body, :author_id
  
  def initialize(options)
    @id = options['id']
    @title = options['title']
    @body = options['body']
    @author_id = options['author_id']
  end
  
  def self.find_by_id(id)
    question = QuestionsDatabase.instance.execute(<<-SQL, id)
    SELECT
    *
    FROM 
    questions
    WHERE
    id = ?
    SQL
    raise "id does not exist in db" if question.empty?
    Question.new(question.first)
  end
  
  def self.find_by_author_id(author_id)
    questions = QuestionsDatabase.instance.execute(<<-SQL, author_id)
    SELECT
    *
    FROM 
    questions
    WHERE
    author_id = ?
    SQL
    raise "author_id does not have questions in db" if questions.empty?
    questions.map{|datum| Question.new(datum)}
  end
  
  def self.find_by_title(title)
    question = QuestionsDatabase.instance.execute(<<-SQL, title)
    SELECT
    *
    FROM 
    questions
    WHERE
    title = ?
    SQL
    raise "title does not exist in db" if question.empty?
    Question.new(question.first)
  end

  def self.most_followed(n)
    QuestionFollow.most_followed_questions(n)
  end

  def self.most_liked(n)
    QuestionLike.most_liked_questions(n)
  end
  
  def author
    # self.author_id #maybe return a User instance?
    user_inst = QuestionsDatabase.instance.execute(<<-SQL, self.author_id)
    SELECT
    *
    FROM
    users
    WHERE
    id = ?
    SQL
    raise "user does not exist in db" if user_inst.empty?
    User.new(user_inst.first)
  end
  
  def replies
    Reply.find_by_question_id(@id)
  end

  def followers
    QuestionFollow.followers_for_question_id(@id)
  end

  def likers
    QuestionLike.likers_for_question_id(@id)
  end

  def num_likes
    QuestionLike.num_likes_for_question_id(@id)
  end
end

class Reply
  attr_accessor :body, :author_id, :question_id, :parent_id
  
  def initialize(options)
    @id = options['id']
    @body = options['body']
    @author_id = options['author_id']
    @question_id = options['question_id']
    @parent_id = options['parent_id']
  end
  
  def self.find_by_id(id)
    reply = QuestionsDatabase.instance.execute(<<-SQL, id)
    SELECT
    *
    FROM 
    replies
    WHERE
    id = ?
    SQL
    raise "id does not exist in db" if reply.empty?
    Reply.new(reply.first)
  end
  
  def self.find_by_user_id(user_id)
    replies = QuestionsDatabase.instance.execute(<<-SQL, user_id)
    SELECT
    *
    FROM 
    replies
    WHERE
    author_id = ?
    SQL
    raise "user_id does not have replies in db" if replies.empty?
    replies.map{|datum| Reply.new(datum)}
  end
  
  def self.find_by_question_id(question_id)
    replies = QuestionsDatabase.instance.execute(<<-SQL, question_id)
    SELECT
    *
    FROM 
    replies
    WHERE
    question_id = ?
    SQL
    raise "question_id does not have replies in db" if replies.empty?
    replies.map{|datum| Reply.new(datum)}
  end
  
  def author
    user_inst = QuestionsDatabase.instance.execute(<<-SQL, self.author_id)
    SELECT
    *
    FROM
    users
    WHERE
    id = ?
    SQL
    raise "user does not exist in db" if user_inst.empty?
    User.new(user_inst.first)
  end
  
  def question
    quest_inst = QuestionsDatabase.instance.execute(<<-SQL, self.question_id)
    SELECT
    *
    FROM
    questions
    WHERE
    id = ?
    SQL
    raise "question does not exist in db" if quest_inst.empty?
    Question.new(quest_inst.first)
  end
  
  def parent_reply
    reply_inst = QuestionsDatabase.instance.execute(<<-SQL, self.parent_id)
    SELECT
    *
    FROM
    replies
    WHERE
    id = ?
    SQL
    raise "reply does not exist in db. This could be a top-level reply." if reply_inst.empty?
    Reply.new(reply_inst.first)
  end
  
  def child_replies
    replies = QuestionsDatabase.instance.execute(<<-SQL, @id)
    SELECT
    *
    FROM
    replies
    WHERE
    parent_id = ?
    SQL
    raise "children do not exist in db. This could be a bottom-level reply." if replies.empty?
    replies.map{|r| Reply.new(r)}
  end
  
end

class QuestionFollow
  attr_accessor :author_id, :question_id
  
  def initialize(options)
    @id = options['id']
    @author_id = options['author_id']
    @question_id = options['question_id']
  end
  
  def self.followers_for_question_id(question_id)
    users = QuestionsDatabase.instance.execute(<<-SQL, question_id)
    SELECT 
    users.id, fname, lname
    FROM 
    users
    JOIN
    question_follows ON users.id = question_follows.author_id
    JOIN
    questions ON question_follows.question_id = questions.id
    WHERE
    questions.id = ?
    SQL
    raise "question_id is not followed" if users.empty?
    users.map{|datum| User.new(datum)}
  end
  
  def self.followed_questions_for_user_id(user_id)
    questions = QuestionsDatabase.instance.execute(<<-SQL, user_id)
    SELECT 
    questions.id, questions.title, questions.body, questions.author_id
    FROM 
    users
    JOIN
    question_follows ON users.id = question_follows.author_id
    JOIN
    questions ON question_follows.question_id = questions.id
    WHERE
    users.id = ?
    SQL
    raise "user_id is not following anything" if questions.empty?
    questions.map{|datum| Question.new(datum)}
  end
  
  def self.most_followed_questions(n)
    questions = QuestionsDatabase.instance.execute(<<-SQL, n)
    SELECT 
    questions.id, questions.title, questions.body, questions.author_id
    FROM 
    users
    JOIN
    question_follows ON users.id = question_follows.author_id
    JOIN
    questions ON question_follows.question_id = questions.id
    GROUP BY
    questions.id
    ORDER BY 
    COUNT(*) DESC
    LIMIT 
    ?
    SQL
    raise "no questions have been followed" if questions.empty?
    questions.map{|datum| Question.new(datum)}
  end

  def self.find_by_id(id)
    qf = QuestionsDatabase.instance.execute(<<-SQL, id)
    SELECT
    *
    FROM 
    question_follows
    WHERE
    id = ?
    SQL
    raise "id does not exist in db" if qf.empty?
    QuestionFollow.new(qf.first)
  end

end

class QuestionLike
  attr_accessor :author_id, :question_id

  def initialize(options)
    @id = options['id']
    @author_id = options['author_id']
    @question_id = options['question_id']
  end

  def self.find_by_id(id)
    ql = QuestionsDatabase.instance.execute(<<-SQL, id)
    SELECT
    *
    FROM 
    question_likes
    WHERE
    id = ?
    SQL
    raise "id does not exist in db" if ql.empty?
    QuestionLike.new(ql.first)
  end

  def self.likers_for_question_id(question_id)
    users = QuestionsDatabase.instance.execute(<<-SQL, question_id)
    SELECT
      users.id, fname, lname
    FROM
      users
    JOIN
      question_likes ON users.id = author_id
    WHERE
      question_id = ?
    SQL
    raise "question_id is not liked" if users.empty?
    users.map{|datum| User.new(datum)}
  end
  
  def self.num_likes_for_question_id(question_id)
    likes = QuestionsDatabase.instance.execute(<<-SQL, question_id)
    SELECT
    COUNT(*)
    FROM
    question_likes
    WHERE
    question_id = ?
    SQL
    likes[0]["COUNT(*)"]
  end
  
  def self.liked_questions_for_user_id(user_id)
    questions = QuestionsDatabase.instance.execute(<<-SQL, user_id)
    SELECT
      questions.id, title, body, questions.author_id
    FROM
      questions
    JOIN
      question_likes ON questions.id = question_id
    WHERE
      question_likes.user_id = ?
    GROUP BY
      questions.id
    SQL
    raise "user has not liked anything" if questions.empty?
    questions.map{|datum| Question.new(datum)}
  end
  
  def self.most_liked_questions(n)
    questions = QuestionsDatabase.instance.execute(<<-SQL, n)
    SELECT 
    questions.id, questions.title, questions.body, questions.author_id
    FROM 
    users
    JOIN
    question_likes ON users.id = question_likes.user_id
    JOIN
    questions ON question_likes.question_id = questions.id
    GROUP BY
    questions.id
    ORDER BY 
    COUNT(*) DESC
    LIMIT 
    ?
    SQL
    raise "no questions have been liked" if questions.empty?
    questions.map{|datum| Question.new(datum)}
  end
end
