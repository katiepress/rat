#' A simple bar chart with one variable
#'
#' @param df
#' @param col
#'
#' @return
#' @export
#'
#' @examples
#' rat_bar(jj_data, age_group)
#'
#' jj_data %>%
#'    rat_bar(age_group)
rat_bar <- function(df, col) {
  blue.pal <- c("#006E8D", "#008AAF", "#009EC3", "#00ABCA", "#3EB6D1", "#72C2D7")
  color.pal <- c("#006E8D","#00ABCA","#F6943D","#D9542F","#4C4C4E", "#939597")

  light.gray <- "#C6C7C9"
  mid.gray <- "#939597"
  dark.gray <- "#4C4C4E"
  dark.blue <- "#006E8D"
  light.blue <- "#00ABCA"
  dark.orange <- "#D9542F"
  light.orange <- "#F6943D"

  bar_theme <- theme_minimal()+
    theme(text = element_text(family = "brandon", color = dark.gray),
          axis.title = element_blank(),
          axis.text.y = element_blank(),
          axis.text.x = element_blank(),
          panel.grid = element_blank(),
          legend.position = "bottom",
          legend.title = element_blank(),
          legend.text = element_text(size = 16, color = dark.gray, family = "brandon"),
          legend.key.size = unit(.5, 'cm'))


  col <- enquo(col)

  df %>%
    count(!!col) %>%
    mutate(pct = n/sum(n)) %>%
    ggplot(., aes(x = !!col, y = pct, fill = !!col))+
    geom_col()+
    geom_text(aes(label = scales::percent(pct, accuracy = .1),
                  y = pct + .01),
              position = position_dodge(0.9),
              family = "brandon",
              color = dark.gray,
              size = 5.644444444444) +
    scale_fill_manual(values = color.pal)+
    bar_theme
}


