require "open-uri"

class GithubUserFinder
  API_URL = "https://api.github.com/users/".freeze

  GithubUser = Struct.new(:params) do
    delegate :present?, to: :id

    def id
      params["id"]
    end

    def to_user_params
      {
        github_id: id,
        nickname: params["login"],
        name: params["name"],
        image_url: params["avatar_url"]
      }
    end
  end

  def initialize(nickname)
    @nickname = nickname
  end

  def github_user
    @github_user ||= GithubUser.new(find_github_user)
  end

  private

  def find_github_user
    JSON.parse(URI.parse(github_user_url).open.read)
  rescue OpenURI::HTTPError
    {}
  end

  def github_user_url
    "#{API_URL}#{sanitized_nickname}"
  end

  def sanitized_nickname
    @nickname.gsub(/[^A-Za-z0-9_.-]/, "-")
  end
end
