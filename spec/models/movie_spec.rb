require 'rails_helper'

RSpec.describe Movie, type: :model do
  it "is valid with a title, production_year, running_time, rating" do
    movie = Movie.new(
      title: 'DIC',
      production_year: 2000,
      running_time: 120,
      rating: 'G')
    expect(movie).to be_valid
  end
  # タイトルがなければ無効な状態であること
  it "is invalid without a title" do
    movie = Movie.new(title: nil)
    movie.valid?
    expect(movie.errors[:title]).to include("を入力してください")
  end

  # 重複したタイトルなら無効な状態であること リラックマかぶり
  it "is invalid with a duplicate title" do 
   Movie.create(title: "リラックマ", production_year: 2019, running_time: 30, rating: 'G')
   movie = Movie.new(title: "リラックマ", production_year: 2002, running_time: 100, rating: 'R')
   movie.valid? 
   expect(movie.errors[:title]).to include("はすでに存在します")
  end
    
  # タイトルが101文字以上なら無効な状態であること
  it "is invalid with title is 101 or more characters" do 
    movie = Movie.new(title: "あ"  * 101 , production_year: 2002, running_time: 100, rating: 'R')
    movie.valid? 
    expect(movie.errors[:title]).to include("は100文字以内で入力してください")
  end

end
