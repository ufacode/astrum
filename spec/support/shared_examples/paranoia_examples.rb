# frozen_string_literal: true

shared_examples_for 'a Paranoid model' do
  it 'adds a deleted_at where clause' do
    expect(described_class.all.where_sql).to include('`deleted_at` IS NULL')
  end

  it 'skips adding the deleted_at where clause when unscoped' do
    expect(described_class.unscoped.where_sql.to_s).not_to include('deleted_at') # to_s to handle nil.
  end
end
