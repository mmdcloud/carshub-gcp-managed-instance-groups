# resource "google_cloudbuild_trigger" "build-trigger" {
#   name     = "my-trigger"
#   location = "global"

#   trigger_template {
#     branch_name = "main"
#     repo_name   = "my-repo"
#   }

#   build {
#     step {
#       name       = "gcr.io/cloud-builders/gsutil"
#       args       = ["cp", "gs://mybucket/remotefile.zip", "localfile.zip"]
#       timeout    = "120s"
#       secret_env = ["MY_SECRET"]
#     }

#     step {
#       name   = "ubuntu"
#       script = "echo hello" # using script field
#     }

#     source {
#       storage_source {
#         bucket = "mybucket"
#         object = "source_code.tar.gz"
#       }
#     }
#     tags = ["build", "newFeature"]
#     substitutions = {
#       _FOO = "bar"
#       _BAZ = "qux"
#     }
#     queue_ttl   = "20s"
#     logs_bucket = "gs://mybucket/logs"
#     secret {
#       kms_key_name = "projects/myProject/locations/global/keyRings/keyring-name/cryptoKeys/key-name"
#       secret_env = {
#         PASSWORD = "ZW5jcnlwdGVkLXBhc3N3b3JkCg=="
#       }
#     }
#     available_secrets {
#       secret_manager {
#         env          = "MY_SECRET"
#         version_name = "projects/myProject/secrets/mySecret/versions/latest"
#       }
#     }
#     artifacts {
#       images = ["gcr.io/$PROJECT_ID/$REPO_NAME:$COMMIT_SHA"]
#       objects {
#         location = "gs://bucket/path/to/somewhere/"
#         paths    = ["path"]
#       }

#       npm_packages {
#         package_path = "package.json"
#         repository   = "https://us-west1-npm.pkg.dev/myProject/quickstart-nodejs-repo"
#       }

#       python_packages {
#         paths      = ["dist/*"]
#         repository = "https://us-west1-python.pkg.dev/myProject/quickstart-python-repo"
#       }

#       maven_artifacts {
#         repository  = "https://us-west1-maven.pkg.dev/myProject/quickstart-java-repo"
#         path        = "/workspace/my-app/target/my-app-1.0.SNAPSHOT.jar"
#         artifact_id = "my-app"
#         group_id    = "com.mycompany.app"
#         version     = "1.0"
#       }
#     }
#     options {
#       source_provenance_hash  = ["MD5"]
#       requested_verify_option = "VERIFIED"
#       machine_type            = "N1_HIGHCPU_8"
#       disk_size_gb            = 100
#       substitution_option     = "ALLOW_LOOSE"
#       dynamic_substitutions   = true
#       log_streaming_option    = "STREAM_OFF"
#       worker_pool             = "pool"
#       logging                 = "LEGACY"
#       env                     = ["ekey = evalue"]
#       secret_env              = ["secretenv = svalue"]
#       volumes {
#         name = "v1"
#         path = "v1"
#       }
#     }
#   }
# }