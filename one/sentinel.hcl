sentinel {
  features = {
    terraform = true
  }
}
import "plugin" "tfplan/v2" {
  config = {
    plan_path = "./plan.json"
  }
}
policy "http-public-ingress" {
  source            = "./http-public-ingress.sentinel"
  enforcement_level = "hard-mandatory"
}



policy "sample" {
  source            = "./sample.sentinel"
  enforcement_level = "advisory"
}
