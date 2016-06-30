
class Archare::Introducer
	def  introduce
    puts """

    Archare crawler

      Usage:
        crawler = Archare.crawler

        leetcode tags:
          crawler.lc_tags

        leetcode problems:
          crawler.lc_problems

        leetcode tags-problems map:
          crawler.lc_tags_problems_map

      Update data from leetcode:
        crawler.update_lc_data         (updating time is about 1 minute)

    """
    
	end
end