class Games::Form < ApplicationForm
  validates :game_type_id, presence: true
  validates :batch_id, presence: true
  validate :valid_batch

  def initialize(object, params = ActionController::Parameters.new, current_user:)
    @current_user = current_user
    super(object, params)
  end

  def game_type_id
    params["game_type_id"]
  end

  def batch_id
    params["batch_id"]
  end

  def game_types_as_options
    GameTypeDecorator.game_types_as_options
  end

  def batches_as_options
    batches_scope.ordered_by_name.map(&method(:to_option))
  end

  def save
    return unless valid?

    Game.transaction do
      @object = game_type.new_game(user: @current_user)
      @object.batch = batch
      @object.users << batch.users
      @object.save

      beatle_playlists = @object.players.map(&:create_beatle_playlist)

      @object.players.each do |player|
        beatle_playlists.excluding(player.beatle_playlist).each do |beatle_playlist|
          player.beatle_playlist_guesses.create(guessing_game_beatle_playlist: beatle_playlist)
        end
      end
    end
  end

  private

  def game_type
    @game_type ||= GameType.find(game_type_id)
  end

  def batch
    @batch ||= batches_scope.find_by(id: batch_id)
  end

  def valid_batch
    return if batch.present? || errors[:batch_id].present?

    errors.add(:batch_id, "does not exist")
  end

  def batches_scope
    Pundit.policy_scope(@current_user, Batch)
  end

  def to_option(batch)
    [batch.decorate.to_label, batch.id]
  end
end
