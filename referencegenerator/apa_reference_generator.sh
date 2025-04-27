#!/bin/bash

echo "APA Reference Generator"
echo "Select source type:"
echo "1) Book"
echo "2) YouTube Video"
echo "3) Web Article"
echo "4) Podcast Episode"
echo "5) Movie"
read -p "Enter number: " choice

echo ""

case $choice in
1)
    read -p "Author's last name: " lastname
    read -p "Author's initials (e.g., J.D.): " initials
    read -p "Year of publication: " year
    read -p "Title of the book: " title
    read -p "Publisher: " publisher

    echo -e "\nAPA Reference:"
    echo "$lastname, $initials. ($year). *$title*. $publisher."
    ;;

2)
    read -p "Name of creator or organization: " creator
    read -p "Year (YYYY): " year
    read -p "Month and day (e.g., July 14): " date
    read -p "Title of the video: " title
    read -p "URL: " url

    echo -e "\nAPA Reference:"
    echo "$creator. ($year, $date). *$title* [Video]. YouTube. $url"
    ;;

3)
    read -p "Author's last name: " lastname
    read -p "Author's initials: " initials
    read -p "Year (YYYY): " year
    read -p "Month and day (e.g., March 12): " date
    read -p "Title of the article: " title
    read -p "Website name: " site
    read -p "URL: " url

    echo -e "\nAPA Reference:"
    echo "$lastname, $initials. ($year, $date). *$title*. $site. $url"
    ;;

4)
    read -p "Host's last name: " lastname
    read -p "Host's initials: " initials
    read -p "Year (YYYY): " year
    read -p "Month and day (e.g., October 10): " date
    read -p "Title of the episode: " title
    read -p "Podcast name: " podcast
    read -p "URL: " url

    echo -e "\nAPA Reference:"
    echo "$lastname, $initials. (Host). ($year, $date). *$title* [Audio podcast episode]. In $podcast. $url"
    ;;

5)
    read -p "Director's last name: " lastname
    read -p "Director's initials: " initials
    read -p "Year of release: " year
    read -p "Title of the movie: " title
    read -p "Production company: " company

    echo -e "\nAPA Reference:"
    echo "$lastname, $initials. (Director). ($year). *$title* [Film]. $company."
    ;;

*)
    echo "Invalid choice."
    ;;
esac
