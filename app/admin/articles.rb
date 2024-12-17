ActiveAdmin.register Article do
  # 許可するパラメータ
  permit_params :title, :category, :content, :published_at

  # フィルターの設定
  filter :title
  filter :category
  filter :published_at

  # インデックス画面（一覧表示）のカスタマイズ
  index do
    selectable_column
    id_column
    column :title
    column :category
    column :published_at
    actions
  end

  # フォーム画面のカスタマイズ
  form do |f|
    f.inputs "Article Details" do
      f.input :title
      f.input :category
      f.input :content
      f.input :published_at, as: :datepicker
    end
    f.actions
  end

  # 詳細画面のカスタマイズ
  show do
    attributes_table do
      row :id
      row :title
      row :category
      row :content
      row :published_at
    end
  end
end
