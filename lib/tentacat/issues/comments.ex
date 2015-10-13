defmodule Tentacat.Issues.Comments do
  import Tentacat
  alias Tentacat.Client

  @doc """
  List issue comments

  ## Example

      Tentacat.Issues.Comments.list "elixir-lang", "elixir", "3"
      Tentacat.Issues.Comments.list "elixir-lang", "elixir", "3", client

  More info at: https://developer.github.com/v3/issues/comments/#list-comments-on-an-issue
  """
  @spec list(binary, binary, binary, Client.t) :: Tentacat.response
  def list(owner, repo, issue_id, client \\ %Client{}) do
    get "repos/#{owner}/#{repo}/issues/#{issue_id}/comments", client
  end

@doc """
  Create an issue comment

  ## Example

      Tentacat.Issues.Comments.new "elixir-lang", "elixir", "3", "Looks good!"
      Tentacat.Issues.Comments.new "elixir-lang", "elixir", "3", "Looks good!", client

  More info at: https://developer.github.com/v3/issues/comments/#create-a-comment
  """
  @spec new(binary, binary, binary, binary, Client.t) :: Tentacat.response
  def new(owner, repo, issue_id, text, client \\ %Client{}) do
    body = %{
      body: text
    }
    post "repos/#{owner}/#{repo}/issues/#{issue_id}/comments", client, body
  end
end

