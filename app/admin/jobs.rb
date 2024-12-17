ActiveAdmin.register Job do
  # 許可するパラメータを指定
  permit_params :title, :description, :salary, :location, :employment_type, 
                :contact_info, :posted_at, :expires_at, :company_id

# CSVインポート画面へのリンク
action_item :import_csv, only: :index do
  link_to 'CSVインポート', import_csv_admin_jobs_path
end

# CSVインポート用の画面 (GETリクエスト)
collection_action :import_csv, method: :get do
  render 'admin/import_csv'
end

collection_action :upload_csv, method: :post do
  if params[:file].present?
    begin
      Rails.logger.info "CSVアップロードファイルの内容: #{params[:file].inspect}"  # ファイル確認用ログ
      result = []
      SmarterCSV.process(params[:file].path, headers_in_file: true) do |row|
        Rails.logger.info "CSVの1行目: #{row}"  # 行データ確認用ログ
        job_params = row.first

        # パラメータ検証
        Rails.logger.info "処理中のパラメータ: #{job_params}"

        result << Job.create!(job_params)
      end
      redirect_to admin_jobs_path, notice: "CSVインポートが完了しました (#{result.size} 件のジョブを追加しました)"
    rescue => e
      Rails.logger.error "CSVインポートエラー: #{e.message}"  # エラーログ
      redirect_to import_csv_admin_jobs_path, alert: "エラーが発生しました: #{e.message}"
    end
  else
    redirect_to import_csv_admin_jobs_path, alert: "CSVファイルを選択してください"
  end
end

  # フィルタの設定
  filter :title
  filter :location
  filter :salary
  filter :employment_type
  filter :posted_at
  filter :company

  # 一覧画面のカスタマイズ
  index do
    selectable_column
    id_column
    column :title
    column :company
    column :location
    column :salary
    column :employment_type
    column :posted_at
    column :expires_at
    actions
  end

  # 詳細画面のカスタマイズ
  show do
    attributes_table do
      row :id
      row :title
      row :company
      row :description
      row :location
      row :salary
      row :employment_type
      row :contact_info
      row :posted_at
      row :expires_at
      row :created_at
      row :updated_at
    end
  end

  # フォーム画面のカスタマイズ
  form do |f|
    f.inputs "Job Details" do
      f.input :title
      f.input :company, as: :select, collection: Company.all.map { |c| [c.name, c.id] }
      f.input :description
      f.input :location
      f.input :salary
      f.input :employment_type
      f.input :contact_info
      f.input :posted_at, as: :datepicker
      f.input :expires_at, as: :datepicker
    end
    f.actions
  end
end