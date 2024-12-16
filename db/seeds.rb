# 47都道府県のリスト
prefectures = [
  "北海道", "青森県", "岩手県", "宮城県", "秋田県", "山形県", "福島県",
  "茨城県", "栃木県", "群馬県", "埼玉県", "千葉県", "東京都", "神奈川県",
  "新潟県", "富山県", "石川県", "福井県", "山梨県", "長野県", "岐阜県",
  "静岡県", "愛知県", "三重県", "滋賀県", "京都府", "大阪府", "兵庫県",
  "奈良県", "和歌山県", "鳥取県", "島根県", "岡山県", "広島県", "山口県",
  "徳島県", "香川県", "愛媛県", "高知県", "福岡県", "佐賀県", "長崎県",
  "熊本県", "大分県", "宮崎県", "鹿児島県", "沖縄県"
]

# こだわり条件タグ
tag_names = [
  "二種免許取得支援", "給与補償制度", "寮完備・社宅・住居手当", "退職金制度", "土日のみ勤務",
  "年金受給者歓迎", "カーナビ搭載", "最寄り駅より徒歩圏内", "マイカー通勤可", "女性専用の施設完備",
  "勤務時間選択", "未経験者歓迎", "転職支援金制度", "出張面接・電話面接", "防犯設備の充実",
  "GPS無線", "昼日勤務", "夜日勤務", "保証人不要", "自動日報システム装備"
]

# 会社データを作成
puts "Creating companies..."
10.times do |i|
  Company.find_or_create_by!(
    name: "会社#{i + 1}",
    address: "#{prefectures.sample} #{rand(1..5)}丁目#{rand(1..10)}番地",
    contact_number: "03-#{rand(1000..9999)}-#{rand(1000..9999)}" # ランダムな電話番号
  )
end

# タグデータを作成
puts "Creating tags..."
tag_names.each do |name|
  Tag.find_or_create_by!(name: name)
end

# 求人データを作成
puts "Creating jobs..."
companies = Company.all
tags = Tag.all

100.times do |i|
  job = Job.create!(
    title: "求人タイトル#{i + 1}",
    description: "これはサンプルの求人説明文です。仕事内容や詳細をここに記載します。",
    salary: "月給#{rand(20..50)}万円〜#{rand(50..80)}万円",
    location: prefectures.sample, # ランダムな都道府県
    company: companies.sample # ランダムな会社
  )

  # 求人にランダムにタグを関連付け（1〜3個のタグ）
  job.tags << tags.sample(rand(1..3))
end

puts "Seed data created successfully!"