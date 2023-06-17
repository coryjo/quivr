#!/bin/bash

#
# Prerequisites:
#
# - Docker
# - Docker Compose
# - Supabase account (https://supabase.io/)
#   - Supabase Project API key
#   - Supabase Project URL
#

#
# Installation Steps:
#
# - Step 1: Clone the repository
#   gh repo clone coryjo/quivr && cd Quivr
#
# - Step 2: Copy the `.XXXXX_env` files
#   cp .backend_env.example backend/.env
#   cp .frontend_env.example frontend/.env

# Use thise environment variables:
#   UPABASE_QUIVRAPP_API_ANON_PUBLIC_KEY
#   SUPABASE_QUIVRAPP_API_JWT_SECRET
#   SUPABASE_QUIVRAPP_API_SERVICE_ROLE_SECRET
#   SUPABASE_QUIVRAPP_API_URL
#   SUPABASE_QUIVRAPP_DB_CONNECTON_STRING
#   SUPABASE_QUIVRAPP_DB_PASSWORD
#   OPENAI_API_KEY
#   ANTHROPIC_API_KEY (optional)


# Write the backend environment variables to a file
backend_env_file="./backend/.env"
ANTHROPIC_API_KEY="" 
AUTHENTICATE="true"
MAX_BRAIN_SIZE=52428800
MAX_REQUESTS_NUMBER=200
GOOGLE_APPLICATION_CREDENTIALS=""  # "/code/application_default_credentials.json"
GOOGLE_CLOUD_PROJECT=""  # XXXXX to be changed with your GCP id

cat << EOF > $backend_env_file
SUPABASE_URL=${SUPABASE_QUIVRAPP_API_URL}
SUPABASE_SERVICE_KEY=${SUPABASE_QUIVRAPP_API_ANON_PUBLIC_KEY}
OPENAI_API_KEY=${OPENAI_API_KEY}
ANTHROPIC_API_KEY=${ANTHROPIC_API_KEY}
JWT_SECRET_KEY=${SUPABASE_QUIVRAPP_API_JWT_SECRET}
AUTHENTICATE=${AUTHENTICATE}
GOOGLE_APPLICATION_CREDENTIALS=${GOOGLE_APPLICATION_CREDENTIALS}
GOOGLE_CLOUD_PROJECT=${GOOGLE_CLOUD_PROJECT}
MAX_BRAIN_SIZE=${MAX_BRAIN_SIZE}
MAX_REQUESTS_NUMBER=${MAX_REQUESTS_NUMBER}
EOF

# output the backend env file
cat $backend_env_file


# Write the frontend environment variables to a file
frontend_env_file="./frontend/.env"
NEXT_PUBLIC_ENV="local"
NEXT_PUBLIC_BACKEND_HTTPS="http://"
NEXT_PUBLIC_BACKEND_HOSTNAME="localhost"
NEXT_PUBLIC_BACKEND_PORT="5050"

cat << EOF > $frontend_env_file
NEXT_PUBLIC_ENV=${NEXT_PUBLIC_ENV}
NEXT_PUBLIC_BACKEND_URL=${NEXT_PUBLIC_BACKEND_HTTPS}${NEXT_PUBLIC_BACKEND_HOSTNAME}:${NEXT_PUBLIC_BACKEND_PORT}
NEXT_PUBLIC_SUPABASE_URL=${SUPABASE_QUIVRAPP_API_URL}
NEXT_PUBLIC_SUPABASE_ANON_KEY=${SUPABASE_QUIVRAPP_API_ANON_PUBLIC_KEY}
EOF

# output the frontend env file
cat $frontend_env_file

# - Step 4: Run the following migration scripts on the Supabase database via the web interface (SQL Editor -> `New query`)
#   Migration Script 1: ./quivr/scripts/supabase_new_store_documents.sql
#   Migration Script 2: ./quivr/scripts/supabase_usage_table.sql
#   Migration Script 3: ./quivr/scripts/supabase_vector_store_summary.sql


# - Step 5: Launch the app
#   `docker compose build && docker compose up`


# - Step 6: Navigate to `localhost:3000` in your browser


