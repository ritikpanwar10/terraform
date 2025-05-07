import boto3
from botocore.exceptions import NoCredentialsError, PartialCredentialsError

def upload_file_to_s3(file_name, bucket_name, object_name=None):
    # If S3 object_name was not specified, use file_name
    if object_name is None:
        object_name = file_name

    # Initialize S3 client
    s3_client = boto3.client('s3')

    try:
        # Upload the file
        s3_client.upload_file(file_name, bucket_name, object_name)
        print(f"File {file_name} uploaded to bucket {bucket_name} as {object_name}.")
    except FileNotFoundError:
        print(f"The file {file_name} was not found.")
    except NoCredentialsError:
        print("Credentials not available.")
    except PartialCredentialsError:
        print("Incomplete credentials provided.")
    except Exception as e:
        print(f"An error occurred: {e}")

if __name__ == "__main__":
    file_path = "/home/panwar/Downloads/key1"
    bucket_name = "my-unique-s3-bucket-name-ritik-devops"
    object_name = "key1"  # Optional: Specify a different name for the object in S3

    upload_file_to_s3(file_path, bucket_name, object_name)