#' A stacked bar chart.
#'
#' @param df a dataframe
#' @param col x-axis variable (numeric)
#' @param group_col color fill variable (categorical)
#'
#' @return
#' @export
#'
#' @examples
#' rat_stacked_bar(jj_data, report_year, race)
#'
#' jj_data %>%
#'    rat_stacked_bar(report_year, race)
rat_stacked_bar <- function(df, col, group_col) {
  blue.pal <- c("#006E8D", "#008AAF", "#009EC3", "#00ABCA", "#3EB6D1", "#72C2D7")
  color.pal <- c("#006E8D","#00ABCA","#F6943D","#D9542F","#4C4C4E", "#939597")

  light.gray <- "#C6C7C9"
  mid.gray <- "#939597"
  dark.gray <- "#4C4C4E"
  dark.blue <- "#006E8D"
  light.blue <- "#00ABCA"
  dark.orange <- "#D9542F"
  light.orange <- "#F6943D"

  stacked_bar_theme <- theme_minimal()+
    theme(text = element_text(family = "brandon", color = dark.gray),
          axis.title = element_blank(),
          axis.text.x = element_text(size = 16, color=dark.gray, family = "brandon"),
          axis.text.y = element_blank(),
          panel.grid = element_blank(),
          legend.position = "bottom",
          legend.title = element_blank(),
          legend.text = element_text(size = 16, color = dark.gray, family = "brandon"),
          legend.key.size = unit(.5, 'cm'))


  col <- enquo(col)
  group_col <- enquo(group_col)

  min.x <- df %>% arrange(!!col) %>% slice(1) %>% pull(!!col)
  max.x <- df %>% arrange(desc(!!col)) %>% slice(1) %>% pull(!!col)

  df %>%
    count(!!col, !!group_col) %>%
    group_by(!!col) %>%
    mutate(pct = n/sum(n)) %>%
    ungroup() %>%
    ggplot(., aes(x = !!col, y = pct, fill = !!group_col))+
    geom_col()+
    geom_text(aes(label = scales::percent(pct, accuracy = .1)),
              position = position_stack(vjust = .5),
              family = "brandon",
              color = "white",
              size = 5.644444444444) +
    scale_fill_manual(values = color.pal)+
    scale_x_continuous(breaks = seq(min.x, max.x, 1))+
    stacked_bar_theme
}
