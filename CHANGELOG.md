<a name="unreleased"></a>
## [Unreleased]



<a name="v0.9.0"></a>
## [v0.9.0] (January 1, 0001)



<a name="v0.8.0"></a>
## [v0.8.0] (April 19, 2021)

- chore(deps): bump hashicorp/terraform to 0.13
- docs(readme): re-generate documentation
- docs(changelog): v0.7.0


<a name="v0.7.0"></a>
## [v0.7.0] (March 2, 2021)

- docs(readme): re-generate documentation
- Merge pull request [#7](https://github.com/spotinst/terraform-spotinst-ocean-eks/issues/7) from brettcave/pass_through_ocean_module_variables
- Bumping to version 0.18.0 to make use of ocean-controller controller_image and image_pull_policy
- Update README to reflect two new variables controller_image and image_pull_policy
- Add input variables to pass through to the ocean controller (controller_image and image_pull_policy)
- docs(changelog): v0.6.0


<a name="v0.6.0"></a>
## [v0.6.0] (February 13, 2021)

- feat: add support for terraform v0.14
- docs(changelog): v0.5.0


<a name="v0.5.0"></a>
## [v0.5.0] (January 27, 2021)

- chore(deps): bump hashicorp/kubernetes from 1.13 to 2.0
- fix(variables): cosmetic changes
- docs(changelog): v0.4.0


<a name="v0.4.0"></a>
## [v0.4.0] (November 17, 2020)

- fix(eks): avoid unnecessary creation of IAM resources (closes [#3](https://github.com/spotinst/terraform-spotinst-ocean-eks/issues/3))
- docs(changelog): v0.3.0


<a name="v0.3.0"></a>
## [v0.3.0] (November 13, 2020)

- feat(ocean): add possibility to create ocean conditionally
- docs(changelog): v0.2.0


<a name="v0.2.0"></a>
## [v0.2.0] (November 13, 2020)

- docs(readme): update outputs
- adding in output for worker_iam_role_name
- adding in output for EKS workers security group id
- docs(readme): generate documentation with terraform_docs
- feat(ocean): install ocean-controller module
- feat(vpc): deploy cluster to an existing vpc (closes [#1](https://github.com/spotinst/terraform-spotinst-ocean-eks/issues/1))
- feat(eks): bump kubernetes from 1.15 to 1.18
- chore(doc): add contribution guidelines
- Initial commit


<a name="v0.1.0"></a>
## v0.1.0 (March 19, 2020)

- Initial commit


[Unreleased]: https://github.com/spotinst/terraform-spotinst-ocean-eks/compare/v0.9.0...HEAD
[v0.9.0]: https://github.com/spotinst/terraform-spotinst-ocean-eks/compare/v0.8.0...v0.9.0
[v0.8.0]: https://github.com/spotinst/terraform-spotinst-ocean-eks/compare/v0.7.0...v0.8.0
[v0.7.0]: https://github.com/spotinst/terraform-spotinst-ocean-eks/compare/v0.6.0...v0.7.0
[v0.6.0]: https://github.com/spotinst/terraform-spotinst-ocean-eks/compare/v0.5.0...v0.6.0
[v0.5.0]: https://github.com/spotinst/terraform-spotinst-ocean-eks/compare/v0.4.0...v0.5.0
[v0.4.0]: https://github.com/spotinst/terraform-spotinst-ocean-eks/compare/v0.3.0...v0.4.0
[v0.3.0]: https://github.com/spotinst/terraform-spotinst-ocean-eks/compare/v0.2.0...v0.3.0
[v0.2.0]: https://github.com/spotinst/terraform-spotinst-ocean-eks/compare/v0.1.0...v0.2.0
