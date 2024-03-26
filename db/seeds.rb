# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
soshi = Admin.find_or_create_by!(email: "soshi@example.com") do |admin|
  admin.password = "password"
end

olivia = User.find_or_create_by!(email: "olivia@example.com") do |user|
  user.name = "Olivia"
  user.password = "password"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.jpg"), filename:"sample-user1.jpg")
  user.introduction = "自作PC初心者です。"
end

james = User.find_or_create_by!(email: "james@example.com") do |user|
  user.name = "James"
  user.password = "password"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2.jpg"), filename:"sample-user2.jpg")
  user.introduction = "cuteなPCが大好きです！"
end

lucas = User.find_or_create_by!(email: "lucas@example.com") do |user|
  user.name = "Lucas"
  user.password = "password"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user3.jpg"), filename:"sample-user3.jpg")
  user.introduction = "空冷信者です。対戦よろしくお願いします！"
end

post1 = Post.find_or_create_by!(title: "できる男のデスク環境！") do |post|
  post.user = olivia
end
PostImage.create(image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post1.jpg"), filename:"sample-post1.jpg"), text:"机を広々使いたいので、シンプルになってます。このレカロ椅子はお気に入りのものでとても座り心地が良く、おすすめです！",post: post1)

post2 = Post.find_or_create_by!(title: "かわいいPC") do |post|
  post.user = james
end
PostImage.create(image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post2.jpg"), filename:"sample-post2.jpg"), text:"これは私の可愛いいPCです！可愛さと性能ならピカいちで二年前から愛用しています！",post: post2)

post3 = Post.find_or_create_by!(title: "V8魂") do |post|
  post.user = lucas
end
PostImage.create(image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post3.jpg"), filename:"sample-post3.jpg"), text:"私はV8を愛しています",post: post3)

post4 = Post.find_or_create_by!(title: "メインPCです") do |post|
  post.user = olivia
end
PostImage.create(image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post4.jpg"), filename:"sample-post4.jpg"), text:"とても性能がいいです！",post: post4)
PostImage.create(image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post5.jpg"), filename:"sample-post5.jpg"), text:"中身はこんな感じです",post: post4)