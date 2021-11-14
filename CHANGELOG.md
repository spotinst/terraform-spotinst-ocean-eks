<a name="unreleased"></a>
## [Unreleased]



<a name="v2.2.0"></a>
## [v2.2.0] (January 1, 0001)



<a name="v2.1.0"></a>
## [v2.1.0] (November 14, 2021)

- feat: add tags to ocean cluster (resolves [#15](https://github.com/spotinst/terraform-spotinst-ocean-eks/issues/15)) ([#22](https://github.com/spotinst/terraform-spotinst-ocean-eks/issues/22))
- docs(changelog): v2.0.0


<a name="v2.0.0"></a>
## [v2.0.0] (November 2, 2021)

- feat(ocean): allow users to specify node selector
- docs(changelog): v1.7.0


<a name="v1.7.0"></a>
## [v1.7.0] (November 2, 2021)

- feat(ocean): allow overridable userdata for worker nodes ([#21](https://github.com/spotinst/terraform-spotinst-ocean-eks/issues/21))
- feat(ocean): autoscaler configuration ([#19](https://github.com/spotinst/terraform-spotinst-ocean-eks/issues/19))
- docs(changelog): v1.6.0


<a name="v1.6.0"></a>
## [v1.6.0] (October 12, 2021)

- feat(ocean): allow update policy config ([#20](https://github.com/spotinst/terraform-spotinst-ocean-eks/issues/20))
- docs(changelog): v1.5.0


<a name="v1.5.0"></a>
## [v1.5.0] (August 24, 2021)

- feat(ocean): new variable: `spot_percentage` ([#16](https://github.com/spotinst/terraform-spotinst-ocean-eks/issues/16))
- docs(changelog): v1.4.0


<a name="v1.4.0"></a>
## [v1.4.0] (July 25, 2021)

- feat(vpc): expose upstream variables (resolves [#13](https://github.com/spotinst/terraform-spotinst-ocean-eks/issues/13))
- docs(changelog): v1.3.0


<a name="v1.3.0"></a>
## [v1.3.0] (July 25, 2021)

- fix(ocean): include worker additional security group ids (resolves [#14](https://github.com/spotinst/terraform-spotinst-ocean-eks/issues/14))
- docs(changelog): v1.2.0


<a name="v1.2.0"></a>
## [v1.2.0] (June 14, 2021)

- feat(ocean): new variables: `whitelist` and `blacklist` (PROD-4617)
- docs(changelog): v1.1.0


<a name="v1.1.0"></a>
## [v1.1.0] (June 6, 2021)

- chore: format variables for better readability
- feat(ocean): add variable: `root_volume_size` ([#11](https://github.com/spotinst/terraform-spotinst-ocean-eks/issues/11))
- docs(changelog): v1.0.0


<a name="v1.0.0"></a>
## [v1.0.0] (May 30, 2021)

- chore(deps): bump terraform-aws-modules/eks to v17.0 ([#9](https://github.com/spotinst/terraform-spotinst-ocean-eks/issues/9))
- docs(changelog): v0.12.0


<a name="v0.12.0"></a>
## [v0.12.0] (May 26, 2021)

- chore(deps): allow only minor releases
- docs(changelog): v0.11.0


<a name="v0.11.0"></a>
## [v0.11.0] (May 25, 2021)

- chore(deps): bump spotinst/spotinst to v1.44.0
- chore(deps): bump hashicorp/kubernetes to v2.2.0
- docs(changelog): v0.10.0


<a name="v0.10.0"></a>
## [v0.10.0] (May 18, 2021)

- chore(deps): update controller image repo to gcr
- docs(changelog): v0.9.0


<a name="v0.9.0"></a>
## [v0.9.0] (April 20, 2021)

- chore(deps): bump spotinst/spotinst to 1.39.0
- docs(changelog): v0.8.0


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


[Unreleased]: https://github.com/spotinst/terraform-spotinst-ocean-eks/compare/v2.2.0...HEAD
[v2.2.0]: https://github.com/spotinst/terraform-spotinst-ocean-eks/compare/v2.1.0...v2.2.0
[v2.1.0]: https://github.com/spotinst/terraform-spotinst-ocean-eks/compare/v2.0.0...v2.1.0
[v2.0.0]: https://github.com/spotinst/terraform-spotinst-ocean-eks/compare/v1.7.0...v2.0.0
[v1.7.0]: https://github.com/spotinst/terraform-spotinst-ocean-eks/compare/v1.6.0...v1.7.0
[v1.6.0]: https://github.com/spotinst/terraform-spotinst-ocean-eks/compare/v1.5.0...v1.6.0
[v1.5.0]: https://github.com/spotinst/terraform-spotinst-ocean-eks/compare/v1.4.0...v1.5.0
[v1.4.0]: https://github.com/spotinst/terraform-spotinst-ocean-eks/compare/v1.3.0...v1.4.0
[v1.3.0]: https://github.com/spotinst/terraform-spotinst-ocean-eks/compare/v1.2.0...v1.3.0
[v1.2.0]: https://github.com/spotinst/terraform-spotinst-ocean-eks/compare/v1.1.0...v1.2.0
[v1.1.0]: https://github.com/spotinst/terraform-spotinst-ocean-eks/compare/v1.0.0...v1.1.0
[v1.0.0]: https://github.com/spotinst/terraform-spotinst-ocean-eks/compare/v0.12.0...v1.0.0
[v0.12.0]: https://github.com/spotinst/terraform-spotinst-ocean-eks/compare/v0.11.0...v0.12.0
[v0.11.0]: https://github.com/spotinst/terraform-spotinst-ocean-eks/compare/v0.10.0...v0.11.0
[v0.10.0]: https://github.com/spotinst/terraform-spotinst-ocean-eks/compare/v0.9.0...v0.10.0
[v0.9.0]: https://github.com/spotinst/terraform-spotinst-ocean-eks/compare/v0.8.0...v0.9.0
[v0.8.0]: https://github.com/spotinst/terraform-spotinst-ocean-eks/compare/v0.7.0...v0.8.0
[v0.7.0]: https://github.com/spotinst/terraform-spotinst-ocean-eks/compare/v0.6.0...v0.7.0
[v0.6.0]: https://github.com/spotinst/terraform-spotinst-ocean-eks/compare/v0.5.0...v0.6.0
[v0.5.0]: https://github.com/spotinst/terraform-spotinst-ocean-eks/compare/v0.4.0...v0.5.0
[v0.4.0]: https://github.com/spotinst/terraform-spotinst-ocean-eks/compare/v0.3.0...v0.4.0
[v0.3.0]: https://github.com/spotinst/terraform-spotinst-ocean-eks/compare/v0.2.0...v0.3.0
[v0.2.0]: https://github.com/spotinst/terraform-spotinst-ocean-eks/compare/v0.1.0...v0.2.0
