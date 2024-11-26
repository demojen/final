run "r1" {
    
    command = apply
    # module {
    #   source = ""
    # }
    assert {
        condition = aws_instance.example.ami == "fkfkfkfkf"
        error_message = "wrong ami id passed"
      
    }
  
}