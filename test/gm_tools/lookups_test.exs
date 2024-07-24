defmodule GmTools.LookupsTest do
  use GmTools.DataCase

  alias GmTools.Lookups

  describe "verbs" do
    alias GmTools.Lookups.Verb

    import GmTools.LookupsFixtures

    @invalid_attrs %{verb: nil}

    test "list_verbs/0 returns all verbs" do
      verb = verb_fixture()
      assert Lookups.list_verbs() == [verb]
    end

    test "get_verb!/1 returns the verb with given id" do
      verb = verb_fixture()
      assert Lookups.get_verb!(verb.id) == verb
    end

    test "create_verb/1 with valid data creates a verb" do
      valid_attrs = %{verb: "some verb"}

      assert {:ok, %Verb{} = verb} = Lookups.create_verb(valid_attrs)
      assert verb.verb == "some verb"
    end

    test "create_verb/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Lookups.create_verb(@invalid_attrs)
    end

    test "update_verb/2 with valid data updates the verb" do
      verb = verb_fixture()
      update_attrs = %{verb: "some updated verb"}

      assert {:ok, %Verb{} = verb} = Lookups.update_verb(verb, update_attrs)
      assert verb.verb == "some updated verb"
    end

    test "update_verb/2 with invalid data returns error changeset" do
      verb = verb_fixture()
      assert {:error, %Ecto.Changeset{}} = Lookups.update_verb(verb, @invalid_attrs)
      assert verb == Lookups.get_verb!(verb.id)
    end

    test "delete_verb/1 deletes the verb" do
      verb = verb_fixture()
      assert {:ok, %Verb{}} = Lookups.delete_verb(verb)
      assert_raise Ecto.NoResultsError, fn -> Lookups.get_verb!(verb.id) end
    end

    test "change_verb/1 returns a verb changeset" do
      verb = verb_fixture()
      assert %Ecto.Changeset{} = Lookups.change_verb(verb)
    end
  end
end
