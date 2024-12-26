import 'package:buoi7/screens/PostDetail.dart';
import 'package:buoi7/service/apiService.dart';
import 'package:flutter/material.dart';
import '../models/post.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  late Future<List<Post>> futurePosts;

  @override
  void initState() {
    super.initState();
    futurePosts = ApiService().fetchAllPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( // Add Scaffold as Material widget ancestor
      appBar: AppBar(
        title: const Text('Bài viết'),
      ),
      body: FutureBuilder<List<Post>>(
        future: futurePosts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Lỗi: ${snapshot.error}'),
            );
          } else if (snapshot.hasData) {
            List<Post> posts = snapshot.data!;
            return ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                return Card( // Wrap ListTile in Card for better visual appearance
                  margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: ListTile(
                    title: Text(posts[index].title!),
                    subtitle: Text(posts[index].body!),
                    onTap: () {
                      Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PostDetailScreen(
                           {
                             "id": 1,
                             "title": posts[index].title,
                             "body": posts[index].body,
                             "img": posts[index].img // Thay thế bằng base64 image nếu có
                           }
                        ),
                      ),
                      );
                    }
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: Text('Không có dữ liệu'),
            );
          }
        },
      ),
    );
  }
}