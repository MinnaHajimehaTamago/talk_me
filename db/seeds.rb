# coding: utf-8

# # ゲストのID
# guest = User.find_or_create_by!(email: 'guest@example.com') do |user|
#           user.nickname = 'GUEST'
#           user.password = 'guest2021'
#           user.password_confirmation = 'guest2021'
#         end
# guest_id = guest.id

20.times do |i|
  user = User.find_by(email: "sample#{i+1}@example.com")
  user.image.attach(io: File.open(File.expand_path("../../public/sample_icons/#{i+1}.jpeg", __FILE__)), filename: "#{i+1}.jpeg") if user.present?
end

# # users
# suga = User.create(nickname: 'すが',email: 'sample1@example.com', password: 'password', password_confirmation: 'password')
# nishiura = User.create(nickname: 'たえ',email: 'sample2@example.com', password: 'password', password_confirmation: 'password')
# hashimoto = User.create(nickname: 'もじゃもじゃ',email: 'sample3@example.com', password: 'password', password_confirmation: 'password')
# nagao = User.create(nickname: '軟体人間',email: 'sample4@example.com', password: 'password', password_confirmation: 'password')
# magario = User.create(nickname: 'なすび',email: 'sample5@example.com', password: 'password', password_confirmation: 'password')
# kawamura = User.create(nickname: 'ぼーず',email: 'sample6@example.com', password: 'password', password_confirmation: 'password')
# ishikawa = User.create(nickname: 'みかんちゃん',email: 'sample7@example.com', password: 'password', password_confirmation: 'password')
# kimura = User.create(nickname: 'きむら',email: 'sample8@example.com', password: 'password', password_confirmation: 'password')
# kondo = User.create(nickname: 'ご近所さん',email: 'sample9@example.com', password: 'password', password_confirmation: 'password')
# hoshiyama = User.create(nickname: 'お姉さん',email: 'sample10@example.com', password: 'password', password_confirmation: 'password')
# okamoto = User.create(nickname: 'trumpet',email: 'sample11@example.com', password: 'password', password_confirmation: 'password')
# aoki = User.create(nickname: 'ai',email: 'sample@12example.com', password: 'password', password_confirmation: 'password')
# shioyama = User.create(nickname: 'ヤニ',email: 'sample13@example.com', password: 'password', password_confirmation: 'password')
# hyodo = User.create(nickname: 'メガネ',email: 'sample14@example.com', password: 'password', password_confirmation: 'password')
# komatsu = User.create(nickname: '元CA',email: 'sample15@example.com', password: 'password', password_confirmation: 'password')
# nakasuji = User.create(nickname: 'お風呂上がり',email: 'sample16@example.com', password: 'password', password_confirmation: 'password')
# tamashiro = User.create(nickname: 'たまぐすく',email: 'sample17@example.com', password: 'password', password_confirmation: 'password')
# maruyama = User.create(nickname: 'maru',email: 'sample18@example.com', password: 'password', password_confirmation: 'password')
# isaji = User.create(nickname: '赤メガネ',email: 'sample19@example.com', password: 'password', password_confirmation: 'password')
# yoshioka = User.create(nickname: '白熊さん',email: 'sample20@example.com', password: 'password', password_confirmation: 'password')

# users = [suga, nishiura, hashimoto, nagao, magario, kawamura,  ishikawa, kimura, kondo, hoshiyama, okamoto, aoki, shioyama, hyodo, komatsu, nakasuji, tamashiro, maruyama, isaji, yoshioka]

# users.each_with_index do |user, i|
#   user.image.attach(io: File.open("public/sample_icons/#{i+1}.jpeg"), filename: "#{i+1}.jpeg")
# end

# # tags
# # 体の特徴
# physical_tags = ['身長が低い', '身長が高い', 'スレンダー', 'ふくよか', 'マッチョ']
# physical_tag_ids = []
# physical_tags.each do |name|
#   tag = Tag.create(name: name, officiality_id: rand(0..1))
#   physical_tag_ids << tag.id
# end

# # 髪型
# hair_tags = ['パーマ', 'ストレート', '髪が長い', '髪が短い']
# hair_tag_ids = []
# hair_tags.each do |name|
#   tag = Tag.create(name: name, officiality_id: rand(0..1))
#   hair_tag_ids << tag.id
# end

# # 顔の特注
# face_tags = ['目が大きい', '目が細い', '鼻筋が通ってる', '鼻が大きい', '鼻が小さい', '口が大きい', '口が小さい']
# face_tag_ids = []
# face_tags.each do |name|
#   tag = Tag.create(name: name, officiality_id: rand(0..1))
#   face_tag_ids << tag.id
# end

# # 色
# colors = ['黒', '白', '黄', '緑', '紺', '赤', '青', 'グレー']
# # 服装（シャツ）
# tops_tag_ids = []
# colors.each do |color|
#   tag = Tag.create(name: "#{color}のシャツ", officiality_id: rand(0..1))
#   tops_tag_ids << tag.id
# end

# # 服装（アウター）
# outer_tag_ids = []
# colors.each do |color|
#   tag = Tag.create(name: "#{color}のアウター", officiality_id: rand(0..1))
#   outer_tag_ids << tag.id
# end

# # 服装（ズボン）
# bottoms_tag_ids = []
# colors.each do |color|
#   tag = Tag.create(name: "#{color}のズボン", officiality_id: rand(0..1))
#   tops_tag_ids << tag.id
# end

# # 靴
# shoes_tag_ids = []
# colors.each do |color|
#   tag = Tag.create(name: "#{color}の靴", officiality_id: rand(0..1))
#   tops_tag_ids << tag.id
# end

# # 目立つポイント
# point_tags = ['目の下にホクロ', '小指に指輪', '銀のブレスレット', '革のブレスレット']
# point_tag_ids = []
# point_tags.each do |name|
#   tag = Tag.create(name: name, officiality_id: rand(0..1))
#   point_tag_ids << tag.id
# end

# # 所属
# belongs_tags = ['大阪音楽大学', '京都市立芸術大学', '大阪教育大学', '相愛大学', '大阪芸術大学']
# belongs_tag_ids = []
# belongs_tags.each do |name|
#   tag = Tag.create(name: name, officiality_id: rand(0..1))
#   belongs_tag_ids << tag.id
# end

# # 楽器
# instrument_tags = ['トランペット', 'トロンボーン', 'ホルン', 'ユーフォニアム', 'チューバ']
# instrument_tag_ids = []
# instrument_tags.each do |name|
#   tag = Tag.create(name: name, officiality_id: rand(0..1))
#   instrument_tag_ids << tag.id
# end

# # 場所
# place_tags = ['たまご公園', 'たまご喫茶店', 'たまごホール', 'たまごコンビニ', 'たまご居酒屋', 'たまごバーガーショップ']
# place_tag_ids = []
# place_tags.each do |name|
#   tag = Tag.create(name: name, officiality_id: rand(0..1))
#   place_tag_ids << tag.id
# end

# # user_tag_relations
# users.each do |user|
#   UserTagRelation.create(tag_id: physical_tag_ids.sample, user_id: user.id)
#   UserTagRelation.create(tag_id: hair_tag_ids.sample, user_id: user.id)
#   UserTagRelation.create(tag_id: face_tag_ids.sample, user_id: user.id)
#   UserTagRelation.create(tag_id: tops_tag_ids.sample, user_id: user.id)
#   UserTagRelation.create(tag_id: outer_tag_ids.sample, user_id: user.id)
#   UserTagRelation.create(tag_id: bottoms_tag_ids.sample, user_id: user.id)
#   UserTagRelation.create(tag_id: shoes_tag_ids.sample, user_id: user.id)
#   UserTagRelation.create(tag_id: point_tag_ids.sample, user_id: user.id)
#   UserTagRelation.create(tag_id: belongs_tag_ids.sample, user_id: user.id)
#   UserTagRelation.create(tag_id: instrument_tag_ids.sample, user_id: user.id)
#   UserTagRelation.create(tag_id: place_tag_ids.sample, user_id: user.id)
# end

# # ゲストのタグ
# guest_tags = [physical_tag_ids[1], hair_tag_ids[0], tops_tag_ids[0], bottoms_tag_ids[6], bottoms_tag_ids[0], instrument_tag_ids[4], belongs_tag_ids[0]]
# guest_tags.each do |name|
#   UserTagRelation.create(tag_id: name, user_id: guest_id)
# end


# # signs
# texts = ["2人だけで話したい!",
#          "相談に乗って欲しい",
#          "ずっと話してみたいと思っています！",
#          "服の趣味が一緒だなって思ってました！",
#          "伝えたいことがあります",
#          "この前のこと謝りたい",
#          "言いにくいけど言いたいことが…",
#          "ご飯いこ〜",
#          "一緒に遊びに行きたい！",
#          "財布落としませんでした？",
# ]

# users[0..9].each_with_index do |user, i|
#   sign = Sign.create(text: texts[i], user_id: user.id)
#   guest_tags.length.times do |index|
#     SignTagRelation.create(sign_id: sign.id, tag_id: guest_tags[index])
#   end
#   SignTagRelation.create(sign_id: sign.id, tag_id: point_tag_ids.sample)
#   SignTagRelation.create(sign_id: sign.id, tag_id: face_tag_ids.sample)
# end

# # ゲストのサイン
# 5.times do
#   sign = Sign.create(text: texts.sample, user_id: guest_id)
#   SignTagRelation.create(tag_id: physical_tag_ids.sample, sign_id: sign.id)
#   SignTagRelation.create(tag_id: hair_tag_ids.sample, sign_id: sign.id)
#   SignTagRelation.create(tag_id: face_tag_ids.sample, sign_id: sign.id)
#   SignTagRelation.create(tag_id: tops_tag_ids.sample, sign_id: sign.id)
#   SignTagRelation.create(tag_id: outer_tag_ids.sample, sign_id: sign.id)
#   SignTagRelation.create(tag_id: bottoms_tag_ids.sample, sign_id: sign.id)
#   SignTagRelation.create(tag_id: shoes_tag_ids.sample, sign_id: sign.id)
#   SignTagRelation.create(tag_id: point_tag_ids.sample, sign_id: sign.id)
#   SignTagRelation.create(tag_id: belongs_tag_ids.sample, sign_id: sign.id)
#   SignTagRelation.create(tag_id: instrument_tag_ids.sample, sign_id: sign.id)
#   SignTagRelation.create(tag_id: place_tag_ids.sample, sign_id: sign.id)
# end

# # rooms
# # 話かけられた
# 4.times do |i|
#   room = Room.create
#   RoomUserRelation.create(room_id: room.id, user_id: users[i+10].id)
#   RoomUserRelation.create(room_id: room.id, user_id: guest_id)
#   # messages
#   Message.create(text: "こんにちは！GUESTです！", user_id: guest_id, room_id: room.id)
#   Message.create(text: "こんにちは！", user_id: users[i+10].id, room_id: room.id)
# end

# #話しかけた
# 6.times do |i|
#   room = Room.create
#   RoomUserRelation.create(room_id: room.id, user_id: guest_id)
#   RoomUserRelation.create(room_id: room.id, user_id: users[i+14].id)
#   # messages
#   Message.create(text: "こんにちは！#{users[i+14].nickname}です！", user_id: users[i+14].id, room_id: room.id)
# end