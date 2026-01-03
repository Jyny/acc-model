env "local" {
  src = "file://migrations"
  url = "postgres://user:passwd@localhost:5432/default?sslmode=disable"
  dev = "docker://postgres/18/dev?search_path=public"

  migration {
    dir = "file://migrations"
  }
}
