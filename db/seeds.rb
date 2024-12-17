# Article用タグの作成
article_tags = ["業界動向", "インタビュー", "スキルアップ", "キャリア", "ライフスタイル"]

article_tags.each do |tag|
  ArticleSpecificTag.find_or_create_by!(name: tag)
end

# 記事とタグを紐付け
5.times do |i|
  article = Article.create!(
    title: "サンプル記事タイトル #{i + 1}",
    category: "コラム",
    content: "この記事はサンプルコンテンツです。",
    published_at: DateTime.now - i.days
  )

  # タグをランダムに紐付け
  article.article_specific_tags << ArticleSpecificTag.all.sample(2)
end

puts "ArticleとArticleSpecificTagのデータ作成が完了しました！"