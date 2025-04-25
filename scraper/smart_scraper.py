import requests
from bs4 import BeautifulSoup
import pandas as pd
from urllib.parse import urlparse

# User input
base_url = input("🔗 Enter the URL of the article archive page: ").strip()
parsed_url = urlparse(base_url)
site_root = f"{parsed_url.scheme}://{parsed_url.netloc}"
base_path = base_url.rstrip("/")

headers = {
    "User-Agent": "Mozilla/5.0 (X11; Linux x86_64; rv:109.0) Gecko/20100101 Firefox/117.0"
}

# Try multiple common selectors for article links
ARTICLE_LINK_SELECTORS = [
    "h3.entry-title a",
    "h2.entry-title a",
    "article h2 a",
    "article h3 a",
    ".post-title a",
    ".td-module-title a",
    ".archive-title a"
]

TITLE_SELECTORS = [
    "h1.entry-title",
    "h1.post-title",
    "h1.title",
    "header h1"
]

CONTENT_SELECTORS = [
    "div.td-post-content",
    "div.post-content",
    "article div.entry-content",
    "div.content",
    "section.article-body"
]

page_number = 1
all_data = []
seen_urls = set()

def find_first_matching(soup, selectors):
    for selector in selectors:
        tag = soup.select_one(selector)
        if tag:
            return tag
    return None

def find_article_links(soup):
    for selector in ARTICLE_LINK_SELECTORS:
        links = soup.select(selector)
        if links:
            return links
    return []

while True:
    if page_number == 1:
        page_url = base_path + "/"
    else:
        page_url = base_path + f"/page/{page_number}/"

    print(f"\n🔍 Scraping page {page_number}: {page_url}")
    response = requests.get(page_url, headers=headers)
    soup = BeautifulSoup(response.content, "html.parser")

    article_links = find_article_links(soup)
    new_links = [link.get("href") for link in article_links if link.get("href") not in seen_urls]

    if not new_links:
        print("✅ No new articles found. Finished scraping.")
        break

    for url in new_links:
        seen_urls.add(url)
        if not url.startswith("http"):
            url = site_root + url

        try:
            article_resp = requests.get(url, headers=headers)
            article_soup = BeautifulSoup(article_resp.content, "html.parser")

            title_tag = find_first_matching(article_soup, TITLE_SELECTORS)
            content_div = find_first_matching(article_soup, CONTENT_SELECTORS)

            first_paragraph = ""
            if content_div:
                paragraph = content_div.find("p")
                if paragraph:
                    first_paragraph = paragraph.get_text(strip=True)

            all_data.append({
                "Title": title_tag.get_text(strip=True) if title_tag else "N/A",
                "Summary": first_paragraph,
                "URL": url
            })

        except Exception as e:
            print(f"⚠️ Error scraping {url}: {e}")

    page_number += 1

# Save results
output_file = "toc_articles_smart.csv"
df = pd.DataFrame(all_data)
df.to_csv(output_file, index=False, encoding="utf-8")
print(f"\n📁 Saved {len(all_data)} articles to '{output_file}'")
