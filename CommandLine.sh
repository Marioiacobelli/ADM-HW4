# Legend of the used dataset columns: $3 = duration; $4 = title; $7 = movie_id; $8 = user_id

csv_file="vodclickstream_uk_movies_03.csv" 

# initialize a new csv file to store the modified csv dataset
output_file="processed_dataset.csv"

# replace all commas within the genres with blank spaces so as to preserve the structure of the csv
sed ':a;s/\("[^"]*\),\([^"]*"\)/\1 \2/;ta' "$csv_file" > "$output_file"



# QUESTION 1: What is the most-watched Netflix title?

# Calculate total time spent on each movie with the array 'movies', using movie_id as indexes, then find the most watched movie ID and total time
most_watched=$(awk -F',' '{movies[$7]+=$3} END {for (movie in movies) print movie, movies[movie]}' "$output_file" | sort -t' ' -k2,2nr | head -n 1)
# Extract movie ID and duration
film_id=$(echo "$most_watched" | awk '{print $1}')
hours_spent=$(echo "$most_watched" | awk '{print $2/3600}')
# Find the movie title using the movie ID
film_title=$(grep "$film_id" "$output_file" | head -n 1 | cut -d',' -f4)
# Print the result
echo "- Most seen movie on Netflix: $film_title with $hours_spent hours"



# QUESTION 2: Report the average time between subsequent clicks on Netflix.com

# Sum up all the clicks durations and divide by the total number of the dataset entries
average_time=$(tail -n +2 "$output_file" | awk -F',' '{sum += $3; count++} END {print sum/count}')
echo "- Average time between subsequent clicks: $average_time seconds"



# QUESTION 3: Provide the ID of the user that has spent the most time on Netflix

# Calculate total time spent by each user with the array 'users', using user_id as indexes, then find the top user ID and total time
top_user=$(awk -F',' '$8 != "" {users[$8]+=$3} END {for (user in users) print user, users[user]}' "$output_file" | sort -t' ' -k2,2nr | head -n 1)
# Extract user ID and total time
user_id=$(echo "$top_user" | awk '{print $1}')
hours_spent=$(echo "$top_user" | awk '{print $2/3600}')
# Print the result
echo "- User with the most total time: $user_id with $hours_spent hours"
