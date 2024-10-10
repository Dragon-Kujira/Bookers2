class Book < ApplicationRecord

  has_one_attached :image
  belongs_to :user

  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true
  validates :body, length: { maximum: 200 }

  scope :created_today, -> { where(created_at: Time.zone.now.all_day) }
  #今日1日で作成した 全Bookを取得します。
  scope :created_yesterday, -> { where(created_at: 1.day.ago.all_day) }
   scope :created_2day_ago, -> { where(created_at: 2.day.ago.all_day) }
   scope :created_3day_ago, -> { where(created_at: 3.day.ago.all_day) }
   scope :created_4day_ago, -> { where(created_at: 4.day.ago.all_day) }
   scope :created_5day_ago, -> { where(created_at: 5.day.ago.all_day) }
   scope :created_6day_ago, -> { where(created_at: 6.day.ago.all_day) }
  #1~6日前で作成した 全Bookを取得します。
  scope :created_this_week, -> { where(created_at: 6.day.ago.beginning_of_day..Time.zone.now.end_of_day) }
  #6日前の0:00から今日の23:59までに作成した 全Bookを取得します。
  scope :created_last_week, -> { where(created_at: 2.week.ago.beginning_of_day..1.week.ago.end_of_day) }
  #2週間前の0:00から1週間前の23:59までに作成した 全Bookを取得します。

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

# 検索方法分岐
  def self.looks(search, word)
    if search == "perfect_match"
      @book = Book.where("title LIKE?","#{word}")
    elsif search == "forward_match"
      @book = Book.where("title LIKE?","#{word}%")
    elsif search == "backward_match"
      @book = Book.where("title LIKE?","%#{word}")
    elsif search == "partial_match"
      @book = Book.where("title LIKE?","%#{word}%")
    else
      @book = Book.all
    end
  end
end