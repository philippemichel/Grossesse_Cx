

tt <- ttpat |> 
  drop_na(suivi_t2) |> 
  mutate(idpro = if_else(suivi_t2 == ps_prochaine_g, "Même professionnel", "Autre Professionnel")) |> 
  group_by(suivi_t2) |> 
  count()
nn <- ttpat |> 
  drop_na(suivi_t2) |> 
  mutate(idpro = if_else(suivi_t2 == ps_prochaine_g, "Même professionnel", "Autre Professionnel")) |> 
  filter (idpro == "Même professionnel") |> 
  group_by(suivi_t2) |> 
  count()

tt$nn <- nn$n

tt |> 
  mutate(pc = nn*100/n) |> 
  ggplot() +
  aes(x = suivi_t2) |> 
