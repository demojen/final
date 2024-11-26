


run "aws_instance_unit" {

  command = plan

  # Assertions to validate the test conditions
  assert {
    condition     = aws_instance.example.tags.Name == "TestEC2Instance"
    error_message = "The EC2 instance Name tag does not match the expected value."
  }

  assert {
    condition     = aws_instance.example.instance_type == "t2.micro"
    error_message = "The EC2 instance type is not t2.micro."
  }

  # assert {
  #   condition     = aws_instance.example.is_present
  #   error_message = "The EC2 instance is not created."
  # }
}
run "aws_instance_integration" {

  command = apply

  # Assertions to validate the test conditions
  assert {
    condition     = aws_instance.example.tags.Name == "TestEC2Instance"
    error_message = "The EC2 instance Name tag does not match the expected value."
  }

  assert {
    condition     = aws_instance.example.instance_type == "t2.micro"
    error_message = "The EC2 instance type is not t2.micro."
  }

  # assert {
  #   condition     = aws_instance.example.is_present
  #   error_message = "The EC2 instance is not created."
  # }
}
