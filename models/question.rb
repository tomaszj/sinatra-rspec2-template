class Question
  include DataMapper::Resource

  validates_uniqueness_of :id
  validates_presence_of :question

  property :id, Serial
  property :question, String
end
