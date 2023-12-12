# Legend of the used dataset columns:
# $3 = duration; $4 = title; $7 = movie_id; $8 = user_id

csv_file="vodclickstream_uk_movies_03.csv"

# initialize a new csv file to store the modified csv 
output_file="processed_dataset.csv"
# replace all commas within the genres with blank spaces so as to preserve the structure of the csv (genres are divided by commas)
sed ':a;s/\("[^"]*\),\([^"]*"\)/\1 \2/;ta' "$csv_file" > "$output_file"

dataset="processed_dataset.csv" # open the new created csv file 


# QUESTION 1: What is the most-watched Netflix title?

# to answer this question, I create a "movies" array using movie_ids as indexes, sum the duration of time spent on each movie, sort the results in descending order according to the second sort field and finally return the id corresponding to the first row
film_id=$(awk -F',' '{movies[$7]+=$3} END {for (movie in movies) print movie, movies[movie]}' "$output_file" | sort -t' ' -k2,2nr | head -n 1 | awk '{print $1}')
# I do the same to store the time (in hours) spent on that movie
hours_spent=$(awk -F',' '{movies[$7]+=$3} END {for (movie in movies) print movie, movies[movie]}' "$output_file" | sort -t' ' -k2,2nr | head -n 1 | awk '{print $2/3600}')
# with the most seen movie_id I can find the corrisponding title: grep is used to search in output_file a line that contains film_id, than split by , and take the value of the 4th column (title)
film_title=$(grep "$film_id" "$output_file" | head -n 1 | cut -d',' -f4)
# print the result
echo "- Most seen movie on Netflix: $film_title with $hours_spent hours"



# QUESTION 2: Report the average time between subsequent clicks on Netflix.com

# to answer this question, I sum up all the clicks durations and divide by the total number of the dataset entries
average_time=$(tail -n +2 "$dataset" | awk -F',' '{sum += $3; count++} END {print sum/count}')
echo "- Average time between subsequent clicks: $average_time seconds"



# QUESTION 3: Provide the ID of the user that has spent the most time on Netflix

# to answer this question, I create a "users" array using user_ids as indexes, sum the duration of time spent by each user, sort the results in descending order according to the second sort field, and finally return the id corresponding to the first row
user_id=$(awk -F',' '$8 != "" {users[$8]+=$3} END {for (user in users) print user, users[user]}' "$output_file" | sort -t' ' -k2,2nr | head -n 1 | awk '{print $1}')
# I do the same to store the time (in hours) spent by the top user
hours_spent=$(awk -F',' '$8 != "" {users[$8]+=$3} END {for (user in users) print user, users[user]}' "$output_file" | sort -t' ' -k2,2nr | head -n 1 | awk '{print $2/3600}')
# print the result
echo "- User with the most total time: $user_id with $hours_spent hours"

