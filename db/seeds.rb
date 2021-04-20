# coding: utf-8

20.times do 
  UserTagRelation.create(user_id: 13, tag_id: rand(1..50))
end